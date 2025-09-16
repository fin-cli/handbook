# fin cli has-command

Detects if a command exists

This commands checks if a command is registered with FIN-CLI. If the command is found then it returns with exit status 0. If the command doesn't exist, then it will exit with status 1.

### OPTIONS
&lt;command_name&gt;...
: The command

### EXAMPLES

    # The "site delete" command is registered.
    $ fin cli has-command "site delete"
    $ echo $?
    0

    # The "foo bar" command is not registered.
    $ fin cli has-command "foo bar"
    $ echo $?
    1

    # Install a FIN-CLI package if not already installed
    $ if ! $(fin cli has-command doctor); then fin package install fin-cli/doctor-command; fi
    Installing package fin-cli/doctor-command (dev-main || dev-master || dev-trunk)
    Updating /home/person/.fin-cli/packages/composer.json to require the package...
    Using Composer to install the package...
    ---
    Success: Package installed.

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
