# fin cli alias add

Creates an alias.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

### OPTIONS

&lt;key&gt;
: Key for the alias.

[\--set-user=&lt;user&gt;]
: Set user for alias.

[\--set-url=&lt;url&gt;]
: Set url for alias.

[\--set-path=&lt;path&gt;]
: Set path for alias.

[\--set-ssh=&lt;ssh&gt;]
: Set ssh for alias.

[\--set-http=&lt;http&gt;]
: Set http for alias.

[\--grouping=&lt;grouping&gt;]
: For grouping multiple aliases.

[\--config=&lt;config&gt;]
: Config file to be considered for operations.
\---
default: global
options:
  - global
  - project
\---

### EXAMPLES

    # Add alias to global config.
    $ fin cli alias add @prod  --set-ssh=login@host --set-path=/path/to/wordpress/install/ --set-user=fincli
    Success: Added '@prod' alias.

    # Add alias to project config.
    $ fin cli alias add @prod --set-ssh=login@host --set-path=/path/to/wordpress/install/ --set-user=fincli --config=project
    Success: Added '@prod' alias.

    # Add group of aliases.
    $ fin cli alias add @multiservers --grouping=servera,serverb
    Success: Added '@multiservers' alias.

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
