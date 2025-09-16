# Implementation Details

This page contains some history on various implementation details of FIN-CLI.

## Bootstrapping WordPress

On a normal web request, your web server calls the `index.php` file in the root of the web directory to bootstrap the WordPress load process:

```
<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * fin-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
define('FIN_USE_THEMES', true);

/** Loads the WordPress Environment and Template */
require( dirname( __FILE__ ) . '/fin-blog-header.php' );
```

You'll notice `index.php` calls `fin-blog-header.php`, which then calls `fin-load.php`, which then calls `fin-config.php`, which then calls `fin-settings.php`.

This last file, `fin-settings.php`, is WordPress' primary bootstrap file. It loads your plugins, active theme, and calls the `init` action.

On the command line, FIN-CLI follows a similar process to bootstrap WordPress. However, instead of loading `index.php`, using the `fin` command starts with this:

```
<?php

// Can be used by plugins/themes to check if FIN-CLI is running or not
define( 'FIN_CLI', true );
define( 'FIN_CLI_VERSION', trim( file_get_contents( FIN_CLI_ROOT . '/VERSION' ) ) );
define( 'FIN_CLI_START_MICROTIME', microtime( true ) );

// Set common headers, to prevent warnings from plugins
$_SERVER['SERVER_PROTOCOL'] = 'HTTP/1.0';
$_SERVER['HTTP_USER_AGENT'] = '';
$_SERVER['REQUEST_METHOD'] = 'GET';
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';

include FIN_CLI_ROOT . '/php/utils.php';
include FIN_CLI_ROOT . '/php/dispatcher.php';
include FIN_CLI_ROOT . '/php/class-fin-cli.php';
include FIN_CLI_ROOT . '/php/class-fin-cli-command.php';

\FIN_CLI\Utils\load_dependencies();

FIN_CLI::get_runner()->start();
```

FIN-CLI includes a good amount of setup code prior to calling `fin-settings.php`. Its bootstrapping process is different than a web request in a couple of notable ways.

### `fin-config.php` is parsed, and then executed

Rather than calling `fin-config.php` directly, FIN-CLI gets the contents of `fin-config.php`, parses out the `require_once ABSPATH . 'fin-settings.php';` statement, and loads the constants into scope with `eval()`. Read "[How FIN-CLI loads WordPress](https://make.wordpress.org/cli/2013/10/24/how-fin-cli-loads-wordpress/)" for a narrative on the historical reasons. After that, FIN-CLI used a custom `fin-settings-cli.php` until v0.24.0 [[#2278](https://github.com/fin-cli/fin-cli/issues/2278)], but parsing `fin-config.php` was kept for backwards compatibility purposes. See also [#1631](https://github.com/fin-cli/fin-cli/issues/1631).

### WordPress is loaded inside of a function

FIN-CLI loads WordPress with the `FIN_CLI::get_runner()->load_wordpress()` method, meaning WordPress plugins and themes aren't loaded in global scope. Any global variables used in plugins or themes need to be explicitly globalized. See [#2089](https://github.com/fin-cli/fin-cli/issues/2089) for the history of this decision.

Once `FIN_CLI::get_runner()->load_wordpress()` calls `fin-settings.php`, WordPress handles the rest of the bootstrap process.

## Command Help Text

The `fin help <command>` has been through several incarnations.

Since FIN-CLI 0.3, it invoked a static `help()` method in the command class, if it existed. ([48a8887d](https://github.com/fin-cli/fin-cli/commit/48a8887d46be25e0c0ad326975729ec816c17331))

Since FIN-CLI 0.6, it looked for a `<command>.1` ROFF file and displayed it using `man`. The ROFF file was compiled from a corresponding `<command>.txt` markdown file and from PHPDoc metadata. ([#24](https://github.com/fin-cli/fin-cli/issues/24)).

Since FIN-CLI 0.11, it generates the help text on the fly. ([#548](https://github.com/fin-cli/fin-cli/pull/548))

## FIN_ADMIN

Most FIN-CLI commands perform administrative actions and they need access to code defined in `fin-admin/includes`. This code can be loaded on-demand or preemptively.

The question is: should the `FIN_ADMIN` constant be set to `true` or `false`?

Initially, FIN-CLI just loaded the fin-admin code and didn't mess with the FIN_ADMIN constant at all.

Then, it sort of pretended it was doing a front-end page load, for doing integration testing ([#69](https://github.com/fin-cli/fin-cli/issues/69)). <sup><a href="#note-1">[1]</a></sup>

Then it pretended it was loading fin-admin, to side-step caching plugins ([#164](https://github.com/fin-cli/fin-cli/issues/164)).

Then it stopped pretending it was loading fin-admin ([#352](https://github.com/fin-cli/fin-cli/issues/352)), because we found a better way to side-step caching plugins. <sup><a href="#note-2">[2]</a></sup>

----

* <sup><a name="note-1">[1]</a></sup>: It turned out that the official WordPress testing suite had a better solution: the `go_to()` method.
* <sup><a name="note-2">[2]</a></sup>: The solution was rolling our own `fin-settings.php` file.

