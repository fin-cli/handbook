# fin plugin auto-updates status

Shows the status of auto-updates for a plugin.

### OPTIONS

[&lt;plugin&gt;...]
: One or more plugins to show the status of the auto-updates of.

[\--all]
: If set, the status of auto-updates for all plugins will be shown.

[\--enabled-only]
: If set, filters list of plugins to only include the ones that have auto-updates enabled.

[\--disabled-only]
: If set, filters list of plugins to only include the ones that have auto-updates disabled.

[\--field=&lt;field&gt;]
: Only show the provided field.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - csv
  - json
  - yaml
  - count
\---

### EXAMPLES

    # Get the status of plugin auto-updates
    $ fin plugin auto-updates status hello
    +-------+----------+
    | name  | status   |
    +-------+----------+
    | hello | disabled |
    +-------+----------+

    # Get the list of plugins that have auto-updates enabled
    $ fin plugin auto-updates status --all --enabled-only --field=name
    akismet
    duplicate-post

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
