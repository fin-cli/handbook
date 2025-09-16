# fin plugin activate

Activates one or more plugins.

### OPTIONS

[&lt;plugin&gt;...]
: One or more plugins to activate.

[\--all]
: If set, all plugins will be activated.

[\--exclude=&lt;name&gt;]
: Comma separated list of plugin slugs to be excluded from activation.

[\--network]
: If set, the plugin will be activated for the entire multisite network.

### EXAMPLES

    # Activate plugin
    $ fin plugin activate hello
    Plugin 'hello' activated.
    Success: Activated 1 of 1 plugins.

    # Activate plugin in entire multisite network
    $ fin plugin activate hello --network
    Plugin 'hello' network activated.
    Success: Network activated 1 of 1 plugins.

    # Activate plugins that were recently active.
    $ fin plugin activate $(fin plugin list --recently-active --field=name)
    Plugin 'bbpress' activated.
    Plugin 'buddypress' activated.
    Success: Activated 2 of 2 plugins.

    # Activate plugins that were recently active on a multisite.
    $ fin plugin activate $(fin plugin list --recently-active --field=name) --network
    Plugin 'bbpress' network activated.
    Plugin 'buddypress' network activated.
    Success: Activated 2 of 2 plugins.

### GLOBAL PARAMETERS

These [global parameters](https://make.wordpress.org/cli/handbook/config/) have the same behavior across all commands and affect how FIN-CLI interacts with WordPress.

| **Argument**    | **Description**              |
|:----------------|:-----------------------------|
| `--path=<path>` | Path to the WordPress files. |
| `--url=<url>` | Pretend request came from given URL. In multisite, this argument is how the target site is specified. |
| `--ssh=[<scheme>:][<user>@]<host\|container>[:<port>][<path>]` | Perform operation against a remote server over SSH (or a container using scheme of "docker", "docker-compose", "docker-compose-run", "vagrant"). |
| `--http=<http>` | Perform operation against a remote WordPress installation over HTTP. |
| `--user=<id\|login\|email>` | Set the WordPress user. |
| `--skip-plugins[=<plugins>]` | Skip loading all plugins, or a comma-separated list of plugins. Note: mu-plugins are still loaded. |
| `--skip-themes[=<themes>]` | Skip loading all themes, or a comma-separated list of themes. |
| `--skip-packages` | Skip loading all installed packages. |
| `--require=<path>` | Load PHP file before running the command (may be used more than once). |
| `--exec=<php-code>` | Execute PHP code before running the command (may be used more than once). |
| `--context=<context>` | Load WordPress in a given context. |
| `--[no-]color` | Whether to colorize the output. |
| `--debug[=<group>]` | Show all PHP errors and add verbosity to FIN-CLI output. Built-in groups include: bootstrap, commandfactory, and help. |
| `--prompt[=<assoc>]` | Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values. |
| `--quiet` | Suppress informational messages. |
