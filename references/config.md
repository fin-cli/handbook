# Config

FIN-CLI has a series of global parameters (e.g. `--path=<path>` and `--user=<user>`) which work with all commands. They are called *global parameters* because they affect how FIN-CLI interacts with WordPress, and have the same behavior across all commands.

```
# `--user=<user>` sets request to a specific WordPress user
$ fin --user=fincli eval 'echo fin_get_current_user()->user_email;'
fincli@example.com
```

For repeated usage, FIN-CLI can also read options from a YAML configuration file (e.g. `fin-cli.yml`). FIN-CLI automatically discovers configuration files on the filesystem based on rules defined below. These configuration files enable specifying default values for both global parameters and subcommand-specific arguments.

```
# WordPress develop includes a `fin-cli.yml` to enable easy use of FIN-CLI
$ pwd
/srv/www/wordpress-develop.dev
$ cat fin-cli.yml
path: src/
```

Arguments are interpreted following an order of precedence, from highest priority to lowest:

1. Command-line arguments.
1. `fin-cli.local.yml` file inside the current working directory (or upwards).
1. `fin-cli.yml` file inside the current working directory (or upwards).
1. `~/.fin-cli/config.yml` file (path can be changed by setting the `FIN_CLI_CONFIG_PATH` environment variable).
1. FIN-CLI defaults.

## Global parameters

The table below lists the available <span class="argument">arguments</span> (specified on the command-line) and <span class="option">options</span> (specified in the configuration file).

<table>
	<thead>
	<tr>
		<th>Description</th>
		<th><span class="argument">Argument</span></th>
		<th><span class="option">Option</span></th>
	</tr>
	</thead>
	<tbody>
		<tr>
		<td>
			Path to the WordPress files.
			<br />
			Default value: <code>null</code>
		</td>
		<td>
			<code class="flag">--path=&lt;path&gt;</code>
		</td>
		<td>
			<code class="option">path: &lt;path&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Perform operation against a remote server over SSH.
			<br />
			Default value: <code>null</code>
		</td>
		<td>
			<code class="flag">--ssh=[&lt;user&gt;@]&lt;host&gt;[:&lt;port&gt;][&lt;path&gt;]</code>
		</td>
		<td>
			<code class="option">ssh: [&lt;user&gt;@]&lt;host&gt;[:&lt;port&gt;][&lt;path&gt;]</code>
		</td>
	</tr>
	<tr>
		<td>
			Perform operation against a remote WordPress install over HTTP.
			<br />
			Default value: <code>null</code>
		</td>
		<td>
			<code class="flag">--http=&lt;http&gt;</code>
		</td>
		<td>
			<code class="option">http: &lt;http&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Pretend request came from given URL. In multisite, this argument is how the target site is specified.
			<br />
			Default value: <code>null</code>
		</td>
		<td>
			<code class="flag">--url=&lt;url&gt;</code>
		</td>
		<td>
			<code class="option">url: &lt;url&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Set the WordPress user.
			<br />
			Default value: <code>null</code>
		</td>
		<td>
			<code class="flag">--user=&lt;id|login|email&gt;</code>
		</td>
		<td>
			<code class="option">user: &lt;id|login|email&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Skip loading all or some plugins. Note: mu-plugins are still loaded.
			<br />
			Default value: <code>&quot;&quot;</code>
		</td>
		<td>
			<code class="flag">--skip-plugins[=&lt;plugin&gt;]</code>
		</td>
		<td>
			<code class="option">skip-plugins: &lt;list&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Skip loading all or some themes.
			<br />
			Default value: <code>&quot;&quot;</code>
		</td>
		<td>
			<code class="flag">--skip-themes[=&lt;theme&gt;]</code>
		</td>
		<td>
			<code class="option">skip-themes: &lt;list&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Skip loading all installed packages.
			<br />
			Default value: <code>false</code>
		</td>
		<td>
			<code class="flag">--skip-packages</code>
		</td>
		<td>
			<code class="option">skip-packages: &lt;bool&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Load PHP file before running the command (may be used more than once).
			<br />
			Default value: <code>[]</code>
		</td>
		<td>
			<code class="flag">--require=&lt;path&gt;</code>
		</td>
		<td>
			<code class="option">require: &lt;path&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Execute PHP code before running the command (may be used more than once).
			<br />
			Default value: <code>[]</code>
		</td>
		<td>
			<code class="flag">--exec=&lt;php-code&gt;</code>
		</td>
		<td>
			<code class="option">exec: &lt;php-code&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Load WordPress in a given context.
			<br />
			Default value: <code>auto</code>
		</td>
		<td>
			<code class="flag">--context[=&lt;context&gt;]</code>
		</td>
		<td>
			<code class="option">context: &lt;context&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			(Sub)commands to disable.
			<br />
			Default value: <code>[]</code>
		</td>
		<td>
			<em>Not available as a flag</em>
		</td>
		<td>
			<code class="option">disabled_commands: &lt;list&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Whether to colorize the output.
			<br />
			Default value: <code>&quot;auto&quot;</code>
		</td>
		<td>
			<code class="flag">--[no-]color</code>
		</td>
		<td>
			<code class="option">color: &lt;bool&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Show all PHP errors; add verbosity to FIN-CLI bootstrap.
			<br />
			Default value: <code>false</code>
		</td>
		<td>
			<code class="flag">--debug[=&lt;group&gt;]</code>
		</td>
		<td>
			<code class="option">debug: &lt;group&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values.
			<br />
			Default value: <code>false</code>
		</td>
		<td>
			<code class="flag">--prompt[=&lt;assoc&gt;]</code>
		</td>
		<td>
			<em>Not available as an option</em>
		</td>
	</tr>
	<tr>
		<td>
			Suppress informational messages.
			<br />
			Default value: <code>false</code>
		</td>
		<td>
			<code class="flag">--quiet</code>
		</td>
		<td>
			<code class="option">quiet: &lt;bool&gt;</code>
		</td>
	</tr>
	<tr>
		<td>
			List of Apache Modules that are to be reported as loaded.
			<br />
			Default value: <code>[]</code>
		</td>
		<td>
			<em>Not available as a flag</em>
		</td>
		<td>
			<code class="option">apache_modules: &lt;list&gt;</code>
		</td>
	</tr>
	</tbody>
</table>

## Config files

FIN-CLI can automatically discover and read options from a few configuration file types (when present):

1. `fin-cli.local.yml` file inside the current working directory (or upwards).
1. `fin-cli.yml` file inside the current working directory (or upwards).
1. `~/.fin-cli/config.yml` file (path can be changed by setting the `FIN_CLI_CONFIG_PATH` environment variable).

Besides the global parameters described above, configuration files can also contain defaults for any subcommand, as well as aliases to one or more WordPress installs.

Here's an annotated example `fin-cli.yml` file:

	# Global parameter defaults
	path: fin-core
	url: http://example.com
	user: admin
	color: false
	disabled_commands:
	  - db drop
	  - plugin install
	require:
	  - path-to/command.php

	# Subcommand defaults (e.g. `fin config create`)
	config create:
		dbuser: root
		dbpass: 
		extra-php: |
			define( 'FIN_DEBUG', true );
			define( 'FIN_POST_REVISIONS', 50 );

	# Aliases to other WordPress installs (e.g. `fin @staging rewrite flush`)
	# An alias can include 'user', 'url', 'path', 'ssh', or 'http'
	@staging:
		ssh: fincli@staging.fin-cli.org
		user: fincli
		path: /srv/www/staging.fin-cli.org
	@production:
		ssh: fincli@fin-cli.org:2222
		user: fincli
		path: /srv/www/fin-cli.org

	# Aliases can reference other aliases to create alias groups
	# Alias groups can be nested
	@both:
	 - @staging
	 - @production

	# '_' is a special value denoting configuration options for this fin-cli.yml
	_:
		# Merge subcommand defaults from the upstream config.yml, instead of overriding
		merge: true
		# Inherit configuration from an arbitrary YAML file
		inherit: prod.yml

## Remote (SSH) configuration

Using the `ssh` option, FIN-CLI can be configured to run on a remote system rather than the current system. Along with the SSH protocol, FIN-CLI also supports connecting to Docker containers (including docker-compose) and Vagrant VMs.

The connection type can be passed via the scheme of the `--ssh` parameter or `ssh` option.

Supported types are:

* `docker:[<user>@]<container_id>` - Runs FIN-CLI in a running Docker container via `docker exec [--user <user>] <container_id> ...`
* `docker-compose:[<user>@]<container_id>` - Runs FIN-CLI in a running Docker container via `docker-compose exec [--user <user>] <container_id> ...`
* `docker-compose-run:[<user>@]<container_id>` - Runs FIN-CLI in a new Docker container via `docker-compose run [--user <user>] <container_id> ...`
* `vagrant` - Runs FIN-CLI in a running Vagrant VM via `vagrant ssh ...`
* `[<user>@]<host>[:<port>]` (ssh) - Runs FIN-CLI on a remote machine through an SSH connection via `ssh [-p <port>] [<user>@]<host> ...`

All connection types support an optional `path` suffix to specify a directory to `cd` to before running FIN-CLI; `path` is a full system path starting with either `/` or `~`. (If `FIN_CLI_SSH_PRE_CMD` is specified, `cd` is run after this pre-command.)

The SSH connection type also supports two advanced connection configuration options, which must be specified via an alias in the YAML configuration:

* `proxyjump` - Specifies a jumpbox connection string, which is passed to `ssh -J`
* `key` - Specifies the key (identify file) to use, which is passed to `ssh -i`

See the documentation about [running FIN-CLI commands remotely](https://make.wordpress.org/cli/handbook/guides/running-commands-remotely/) for more information.

## Context configuration

In FIN-CLI v2.6.0, a new global flag `--context=<context>` was added which allows users to select the WordPress context in which FIN-CLI is supposed to execute its command(s).

One of the main goals is to allow FIN-CLI to run updates on premium plugins and themes without requiring any special setup. From our initial testing, this allows a large range of popular premium extensions to *just work*™ with FIN-CLI in terms of their update procedures.

Possible values for this flag:

* `cli`: The context which has been the default before introduction of this flag. This is something in-between a frontend and an admin request, to get around some of the quirks of WordPress when running on the console.
* `admin`: A context that simulates running a command as if it would be executed in the administration backend. This is meant to be used to get around issues with plugins that limit functionality behind an `is_admin()` check.
* `auto`: Switches between `cli` and `admin` depending on which command is being used. Currently, all `fin plugin *` and `fin theme *` commands use `admin`, while all other commands use `cli`.
* `frontend`: [WIP] This does nothing yet.

By default, the `--context` flag was set to `cli` in the initial release (v2.6.0). In FIN-CLI v2.7.0 and later versions, the default was changed to `auto`. This gradual deployment allowed hosters and site owners to run tests on v2.6.0 by manually setting the context before the default behavior was changed.

If you are still using FIN-CLI v2.6.0 but you want to use the default of `--context=auto`, you can do so by adding the necessary `context: auto` line to your global `fin-cli.yml` configuration file. Feel free to check the documentation on [FIN-CLI configuration files](#config-files) if this is new to you.

## Environment variables

FIN-CLI's behavior can be changed at runtime through the use of environment variables:

* `FIN_CLI_CACHE_DIR` - Directory to store the FIN-CLI file cache. Default is `~/.fin-cli/cache/`.
* `FIN_CLI_CONFIG_PATH` - Path to the global `config.yml` file. Default is `~/.fin-cli/config.yml`.
* `FIN_CLI_CUSTOM_SHELL` - Allows the user to override the default `/bin/bash` shell used.
* `FIN_CLI_DISABLE_AUTO_CHECK_UPDATE` - Disable FIN-CLI automatic checks for updates.
* `FIN_CLI_DOCKER_NO_TTY` - Ignore detected tty status and remove the `--tty` flag from `docker exec` when running FIN-CLI against a docker container via ssh.
* `FIN_CLI_DOCKER_NO_INTERACTIVE` - Ignore detected tty status and remove the `--interactive` flag from `docker exec` when running FIN-CLI against a docker container via ssh.
* `FIN_CLI_PACKAGES_DIR` - Directory to store packages installed through FIN-CLI's package management. Default is `~/.fin-cli/packages/`.
* `FIN_CLI_PHP` - PHP binary path to use when overriding the system default (only works for non-Phar installation).
* `FIN_CLI_PHP_ARGS` - Arguments to pass to the PHP binary when invoking FIN-CLI (only works for non-Phar installation).
* `FIN_CLI_SSH_PRE_CMD` - When using `--ssh=<ssh>`, perform a command before FIN-CLI calls FIN-CLI on the remote server.
* `FIN_CLI_SSH_BINARY` - When using `--ssh=<ssh>`, this is the command that will be called on the remote machine in place of `fin`.
* `FIN_CLI_STRICT_ARGS_MODE` - Avoid ambiguity by telling FIN-CLI to treat any arguments before the command as global, and after the command as local.
* `FIN_CLI_SUPPRESS_GLOBAL_PARAMS` - Set to `true` to skip showing the global parameters at the end of the help screen. This saves screen estate for advanced users.
* `FIN_CLI_FORCE_USER_LOGIN` - Set to `1` to force the value provided to the `--user` flag to be interpreted as a login instead of an ID, to get around ambiguous types.
* `FIN_CLI_EARLY_REQUIRE` - Load one or more custom PHP files (comma-separated) early on in the bootstrap process.
* `FIN_CLI_REQUIRE` - Load one or more custom PHP files (comma-separated) after the bootstrap process. This has the same effect as `--require` on the command line or a `require` mapping in a fin-cli.yml config file.
* `FIN_CLI_USER_AGENT` - Sets the `$_SERVER['HTTP_USER_AGENT']` value that some plugins and tools rely on.

To set an environment variable on demand, simply place the environment variable definition before the FIN-CLI command you mean to run.

    # Use vim to edit a post
    $ EDITOR=vim fin post edit 1

To set the same environment variable value for every shell session, you’ll need to include the environment variable definition in your `~/.bashrc` or `~/.zshrc` file

    # Always use vim to edit a post
    export EDITOR=vim
