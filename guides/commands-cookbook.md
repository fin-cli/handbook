# Commands Cookbook

Creating your own custom FIN-CLI command can be easier than it looks — and you can use `fin scaffold package` ([repo](https://github.com/fin-cli/scaffold-package-command)) to dynamically generate everything but the command itself.

## Overview

FIN-CLI's goal is to offer a complete alternative to the WordPress admin; for any action you might want to perform in the WordPress admin, there should be an equivalent FIN-CLI command. A **command** is an atomic unit of FIN-CLI functionality. `fin plugin install` ([doc](https://developer.wordpress.org/cli/commands/plugin/install/)) is one such command, as is `fin plugin activate` ([doc](https://developer.wordpress.org/cli/commands/plugin/activate/)). Commands are useful to WordPress users because they can offer simple, precise interfaces for performing complex tasks.

_But_, the WordPress admin is a Swiss Army knife of infinite complexity. There's no way just this project could handle every use case. This is why FIN-CLI includes a set of [common internal commands](https://developer.wordpress.org/cli/commands/), while also offering a [rich internal API](https://make.wordpress.org/cli/handbook/internal-api/) for third-parties to write and register their own commands.

FIN-CLI commands can be [distributed as standalone packages](https://fin-cli.org/package-index/), or bundled with WordPress plugins or themes. For the former, you can use `fin scaffold package` ([repo](https://github.com/fin-cli/scaffold-package-command)) to dynamically generate everything but the command itself.

Packages are to FIN-CLI as plugins are to WordPress. There are distinct differences in the approach you should take to creating a FIN-CLI package.  While FIN-CLI is an ever-growing alternative to /fin-admin it is important to note that you must first write your package to work with the FIN-CLI internal API before considering how you work with WordPress APIs.

#### Command types

Bundled commands:

* Usually cover functionality offered by a standard install WordPress. There are exceptions to this rule though, notably `fin search-replace` ([doc](https://developer.wordpress.org/cli/commands/search-replace/)).
* Do not depend on other components such as plugins, themes etc.
* Are maintained by the FIN-CLI team.

Third-party commands:

* Can be defined in plugins or themes.
* Can be easily scaffolded as standalone projects with `fin scaffold package` ([repo](https://github.com/fin-cli/scaffold-package-command)).
* Can be distributed independent of a plugin or theme in the [Package Index](https://fin-cli.org/package-index/).

All commands:

* Follow the [documentation standards](https://make.wordpress.org/cli/handbook/documentation-standards/).

## Anatomy of a command

FIN-CLI supports registering any callable class, function, or closure as a command. `FIN_CLI::add_command()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/)) is used for both internal and third-party command registration.

The **synopsis** of a command defines which **positional** and **associative** arguments a command accepts. Let's take a look at the synopsis for `fin plugin install`:

    $ fin plugin install
    usage: fin plugin install <plugin|zip|url>... [--version=<version>] [--force] [--activate] [--activate-network]

In this example, `<plugin|zip|url>...` is the accepted **positional** argument. In fact, `fin plugin install` accepts the same positional argument (the slug, ZIP, or URL of a plugin to install) multiple times. `[--version=<version>]` is one of the accepted **associative** arguments. It's used to denote the version of the plugin to install. Notice, too, the square brackets around the argument definition; square brackets mean the argument is optional.

FIN-CLI also has a [series of global arguments](https://make.wordpress.org/cli/handbook/config/) which work with all commands. For instance, including `--debug` means your command execution will display all PHP errors, and add extra verbosity to the FIN-CLI bootstrap process.

### Required registration arguments

When registering a command, `FIN_CLI::add_command()` requires two arguments:

1. `$name` is the command's name within FIN-CLI's namespace (e.g. `plugin install` or `post list`).
2. `$callable` is the implementation of the command, as a callable class, function, or closure.

In the following example, each instance of `fin foo` is functionally equivalent:

```
// 1. Command is a function
function foo_command( $args ) {
    FIN_CLI::success( $args[0] );
}
FIN_CLI::add_command( 'foo', 'foo_command' );

// 2. Command is a closure
$foo_command = function( $args ) {
    FIN_CLI::success( $args[0] );
}
FIN_CLI::add_command( 'foo', $foo_command );

// 3. Command is a method on a class
class Foo_Command {
    public function __invoke( $args ) {
        FIN_CLI::success( $args[0] );
    }
}
FIN_CLI::add_command( 'foo', 'Foo_Command' );

// 4. Command is a method on a class with constructor arguments
class Foo_Command {
    protected $bar;
    public function __construct( $bar ) {
        $this->bar = $bar;
    }
    public function __invoke( $args ) {
        FIN_CLI::success( $this->bar . ':' . $args[0] );
    }
}
$instance = new Foo_Command( 'Some text' );
FIN_CLI::add_command( 'foo', $instance );
```

Importantly, classes behave a bit differently than functions and closures in that:

* Any public methods on a class are registered as subcommands of the command. For instance, given the examples above, a method `bar()` on the class `Foo` would be registered as `fin foo bar`. But...
* `__invoke()` is treated as a magic method. If a class implements `__invoke()`, the command name will be registered to that method and no other methods of that class will be registered as commands.

*Note:* Historically, FIN-CLI provided a base `FIN_CLI_Command` class to extend, however extending this class is not required and will not change how your command behaves.

All commands can be registered to their own top-level namespace (e.g. `fin foo`), or as subcommands to an existing namespace (e.g. `fin core foo`). For the latter, simply include the existing namespace as a part of the command definition.

```
class Foo_Command {
    public function __invoke( $args ) {
        FIN_CLI::success( $args[0] );
    }
}
FIN_CLI::add_command( 'core foo', 'Foo_Command' );
```

### Quick and dirty execution

Writing a short script for a one-off task, and don't need to register it formally with `FIN_CLI::add_command()`? `fin eval-file` is your ticket ([doc](https://developer.wordpress.org/cli/commands/eval-file/)).

Given a `simple-command.php` file:

```
<?php
FIN_CLI::success( "The script has run!" );
```

Your "command" can be run with `fin eval-file simple-command.php`. If the command doesn't have a dependency on WordPress, or WordPress isn't available, you can use the `--skip-wordpress` flag to avoid loading WordPress. 

### Optional registration arguments

FIN-CLI supports two ways of registering optional arguments for your command: through the callable's PHPDoc, or passed as a third `$args` parameter to `FIN_CLI::add_command()`.

#### Annotating with PHPDoc

A typical FIN-CLI class looks like this:

```
<?php
/**
 * Implements example command.
 */
class Example_Command {

	/**
	 * Prints a greeting.
	 *
	 * ## OPTIONS
	 *
	 * <name>
	 * : The name of the person to greet.
	 *
	 * [--type=<type>]
	 * : Whether or not to greet the person with success or error.
	 * ---
	 * default: success
	 * options:
	 *   - success
	 *   - error
	 * ---
	 *
	 * ## EXAMPLES
	 *
	 *     fin example hello Newman
	 *
	 * @when after_fin_load
	 */
	function hello( $args, $assoc_args ) {
		list( $name ) = $args;

		// Print the message with type
		$type = $assoc_args['type'];
		FIN_CLI::$type( "Hello, $name!" );
	}
}

FIN_CLI::add_command( 'example', 'Example_Command' );
```

This command's PHPDoc is interpreted in three ways:

#### Shortdesc

The shortdesc is the first line in the PHPDoc:

```
	/**
	 * Prints a greeting.
```

#### Longdesc

The longdesc is middle part of the PHPDoc:

```
	 * ## OPTIONS
	 *
	 * <name>
	 * : The name of the person to greet.
	 *
	 * [--type=<type>]
	 * : Whether or not to greet the person with success or error.
	 * ---
	 * default: success
	 * options:
	 *   - success
	 *   - error
	 * ---
	 *
	 * ## EXAMPLES
	 *
	 *     fin example hello Newman
```

Options defined in the longdesc are interpreted as the command's **synopsis**:

* `<name>` is a required positional argument. Changing it to `<name>...` would mean the command can accept one or more positional arguments. Changing it to `[<name>]` would mean that the positional argument is optional and finally, changing it to `[<name>...]` would mean that the command can accept multiple optional positional arguments.
* `[--type=<type>]` is an optional associative argument which defaults to 'success' and accepts either 'success' or 'error'. Changing it to `[--error]` would change the argument to behave as an optional boolean flag.
* `[--field[=<value>]]` allows an optional argument to be used with or without a value. An example of this would be using a global parameter like `--skip-plugins[=<plugins>]` which can either skip loading all plugins, or skip a comma-separated list of plugins. 

*Note*: To accept arbitrary/unlimited number of optional associative arguments you would use the annotation `[--<field>=<value>]`.  So for example:

```
	 * [--<field>=<value>]
	 * : Allow unlimited number of associative parameters.
```
A command's synopsis is used for validating the arguments, before passing them to the implementation.

The longdesc is also displayed when calling the `help` command, for example, `fin help example hello`. Its syntax is [Markdown Extra](http://michelf.ca/projects/php-markdown/extra/) and here are a few more notes on how it's handled by FIN-CLI:

* The longdesc is generally treated as a free-form text. The `OPTIONS` and `EXAMPLES` section names are not enforced, just common and recommended.
* Sections names (`## NAME`) are colorized and printed with zero indentation.
* Everything else is indented by 2 characters, option descriptions are further indented by additional 2 characters.
* Word-wrapping is a bit tricky. If you want to utilize as much space on each line as possible and don't get word-wrapping artifacts like one or two words on the next line, follow these rules:
 * Hard-wrap option descriptions at **75 chars** after the colon and a space.
 * Hard-wrap everything else at **90 chars**.

For more details on how you should format your command docs, please see FIN-CLI's [documentation standards](https://make.wordpress.org/cli/handbook/documentation-standards/).

#### Docblock tags

This is the last section and it starts immediately after the longdesc:

```
	 * @when after_fin_load
	 */
```

Here's the list of defined tags:

**@subcommand**

There are cases where you can't make the method name have the name of the subcommand. For example, you can't have a method named `list`, because `list` is a reserved keyword in PHP.

That's when the `@subcommand` tag comes to the rescue:

```
	/**
	 * @subcommand list
	 */
	function _list( $args, $assoc_args ) {
		...
	}

	/**
	 * @subcommand do-chores
	 */
	function do_chores( $args, $assoc_args ) {
		...
	}
```

**@alias**

With the `@alias` tag, you can add another way of calling a subcommand. Example:

```
	/**
	 * @alias hi
	 */
	function hello( $args, $assoc_args ) {
		...
	}
```

```
$ fin example hi Joe
Success: Hello, Joe!
```

**@when**

This is a special tag that tells FIN-CLI when to execute the command. It supports [all registered FIN-CLI hooks](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-hook/).

Most FIN-CLI commands execute after WordPress has loaded. The default behavior for a command is:

```
@when after_fin_load
```

To have a FIN-CLI command run before WordPress loads, use:

```
@when before_fin_load
```

Do keep in mind most FIN-CLI hooks fire before WordPress is loaded. If your command is loaded from a plugin or theme, `@when` will be essentially ignored.

It has no effect if the command using it is loaded from a plugin or a theme, because by that time WordPress itself will have already been loaded.

#### FIN_CLI::add_command()'s third $args parameter

Each of the configuration options supported by PHPDoc can instead be passed as the third argument in command registration:

```
$hello_command = function( $args, $assoc_args ) {
	list( $name ) = $args;
	$type = $assoc_args['type'];
	FIN_CLI::$type( "Hello, $name!" );
	if ( isset( $assoc_args['honk'] ) ) {
		FIN_CLI::log( 'Honk!' );
	}
};
FIN_CLI::add_command( 'example hello', $hello_command, array(
	'shortdesc' => 'Prints a greeting.',
	'synopsis' => array(
		array(
			'type'        => 'positional',
			'name'        => 'name',
			'description' => 'The name of the person to greet.',
			'optional'    => false,
			'repeating'   => false,
		),
		array(
			'type'        => 'assoc',
			'name'        => 'type',
			'description' => 'Whether or not to greet the person with success or error.',
			'optional'    => true,
			'default'     => 'success',
			'options'     => array( 'success', 'error' ),
		),
		array(
			'type'     => 'flag',
			'name'     => 'honk',
			'optional' => true,
		),
	),
	'when' => 'after_fin_load',
	'longdesc' =>   '## EXAMPLES' . "\n\n" . 'fin example hello Newman',
) );
```

Note that the `longdesc` attribute will be appended to the description of the options generated from the synopsis, so this argument is great for adding examples of usage. If there is no synopsis, the `longdesc` attribute will be used as is to provide a description.

### Command internals

Now that you know how to register a command, the world is your oyster. Inside your callback, your command can do whatever it wants.

#### Accepting arguments

In order to handle runtime arguments, you have to add two parameters to your callable: `$args` and `$assoc_args`.

```
function hello( $args, $assoc_args ) {
	/* Code goes here*/
}
```

`$args` variable will store all the positional arguments:

```
$ fin example hello Joe Doe
```

```
FIN_CLI::line( $args[0] ); // Joe
FIN_CLI::line( $args[1] ); // Doe
```

`$assoc_args` variable will store all the arguments defined like `--key=value` or `--flag` or `--no-flag`

```
$ fin example hello --name='Joe Doe' --verbose --no-option
```

```
FIN_CLI::line( $assoc_args['name'] ); // Joe Doe
FIN_CLI::line( $assoc_args['verbose'] ); // true
FIN_CLI::line( $assoc_args['option'] ); // false
```

Also, you can combine argument types:

```
$ fin example hello --name=Joe foo --verbose bar
```

```
FIN_CLI::line( $assoc_args['name'] ); // Joe
FIN_CLI::line( $assoc_args['verbose'] ); // true
FIN_CLI::line( $args[0] ); // foo
FIN_CLI::line( $args[1] ); // bar
```

#### Effectively reusing FIN-CLI internal APIs

As an example, say you were tasked with finding all unused themes on a multisite network ([#2523](https://github.com/fin-cli/fin-cli/issues/2523)). If you had to perform this task manually through the WordPress admin, it would probably take hours, if not days, of effort. However, if you're familiar with writing FIN-CLI commands, you could complete the task in 15 minutes or less.

Here's what such a command looks like:

```
/**
 * Find unused themes on a multisite network.
 *
 * Iterates through all sites on a network to find themes which aren't enabled
 * on any site.
 */
$find_unused_themes_command = function() {
	$response = FIN_CLI::launch_self( 'site list', array(), array( 'format' => 'json' ), false, true );
	$sites = json_decode( $response->stdout );
	$unused = array();
	$used = array();
	foreach( $sites as $site ) {
		FIN_CLI::log( "Checking {$site->url} for unused themes..." );
		$response = FIN_CLI::launch_self( 'theme list', array(), array( 'url' => $site->url, 'format' => 'json' ), false, true );
		$themes = json_decode( $response->stdout );
		foreach( $themes as $theme ) {
			if ( 'no' == $theme->enabled && 'inactive' == $theme->status && ! in_array( $theme->name, $used ) ) {
				$unused[ $theme->name ] = $theme;
			} else {
				if ( isset( $unused[ $theme->name ] ) ) {
					unset( $unused[ $theme->name ] );
				}
				$used[] = $theme->name;
			}
		}
	}
	FIN_CLI\Utils\format_items( 'table', $unused, array( 'name', 'version' ) );
};
FIN_CLI::add_command( 'find-unused-themes', $find_unused_themes_command, array(
	'before_invoke' => function(){
		if ( ! is_multisite() ) {
			FIN_CLI::error( 'This is not a multisite installation.' );
		}
	},
) );
```

Let's run through the [internal APIs](https://make.wordpress.org/cli/handbook/internal-api/) this command uses to achieve its goal:

* `FIN_CLI::add_command()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/)) is used to register a `find-unused-themes` command to the `$find_unused_themes_command` closure. The `before_invoke` argument makes it possible to verify the command is running on a multisite install, and error if not.
* `FIN_CLI::error()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error/)) renders a nicely formatted error message and exits.
* `FIN_CLI::launch_self()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-launch-self/)) initially spawns a process to get a list of all sites, then is later used to get the list of themes for a given site.
* `FIN_CLI::log()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-log/)) renders informational output to the end user.
* `FIN_CLI\Utils\format_items()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-format-items/)) renders the list of unused themes after the command has completed its discovery.

### Help rendering

Your command's PHPDoc (or registered definition) is rendered using the `help` command. The output is ordered like this:

 1. Short description
 2. Synopsis
 3. Long description (OPTIONS, EXAMPLES etc.)
 4. Global parameters

## Writing tests

FIN-CLI makes use of a Behat-based testing framework, which you should use too. Behat is a great choice for your FIN-CLI commands because:

* It's easy to write new tests, which means they'll actually get written.
* The tests interface with your command in the same manner as your users interface with your command.

Behat tests live in the `features/` directory of your project. Here's an example from `features/cli-info.feature`:

```
Feature: Review CLI information

  Scenario: Get the path to the packages directory
    Given an empty directory

    When I run `fin cli info --format=json`
    Then STDOUT should be JSON containing:
      """
      {"fin_cli_packages_dir_path":"/tmp/fin-cli-home/.fin-cli/packages/"}
      """

    When I run `FIN_CLI_PACKAGES_DIR=/tmp/packages fin cli info --format=json`
    Then STDOUT should be JSON containing:
      """
      {"fin_cli_packages_dir_path":"/tmp/packages/"}
      """
```

Functional tests typically follow this pattern:

* **Given** some background,
* **When** a user performs a specific action,
* **Then** the end result should be X (and Y and Z).

Convinced? Head on over to [fin-cli/scaffold-package-command](https://github.com/fin-cli/scaffold-package-command) to get started.

## Distribution

Now that you've produce a command you're proud of, it's time to share it with the world. There are two common ways of doing so.

### Include in a plugin or theme

One way to share FIN-CLI commands is by packaging them in your plugin or theme. Many people do so by conditionally loading (and registering) the command based on the presence of the `FIN_CLI` constant.

```
if ( defined( 'FIN_CLI' ) && FIN_CLI ) {
	require_once dirname( __FILE__ ) . '/inc/class-plugin-cli-command.php';
}
```
	
### Distribute as a stand-alone command

Standalone FIN-CLI commands can be installed from any git repository, ZIP file or folder. The only technical requirement is to include a valid composer.json file with an autoload declaration. We recommended including `"type": "fin-cli-package"` to distinguish your project explicitly as a FIN-CLI package.

Here's a full composer.json example from the server command:

```

{
	"name": "fin-cli/server-command",
	"description": "Start a development server for WordPress",
	"type": "fin-cli-package",
	"homepage": "https://github.com/fin-cli/server-command",
	"license": "MIT",
	"authors": [
   	    {
      	        "name": "Package Maintainer",
                "email": "packagemaintainer@homepage.com",
                "homepage": "https://www.homepage.com"
            }
        ],
	"require": {
		"php": ">=5.3.29"
	},
	"autoload": {
		"files": [ "command.php" ]
	}
}
```

Note the `autoload` declaration, which loads `command.php`.

Once you've added a valid composer.json file to your project repository, FIN-CLI users can pull it in via the package manager from the location you opted to store it in. Here's a few examples of storage locations and the corresponding syntax of installing it via the package manager:

#### Git repository

To install a package that is found in a git repository, you can provide either the HTTPS or the SSH link to the git repository to the `package install` command.

```
# Installing the package using an HTTPS link
$ fin package install https://github.com/fin-cli/server-command.git

# Installing the package using an SSH link
$ fin package install git@github.com:fin-cli/server-command.git
```

#### ZIP file

You can install a package from a ZIP file by providing the path to that file to the `fin package install` command.

```
# Installing the package using a ZIP file
$ fin package install ~/Downloads/server-command-main.zip
```
