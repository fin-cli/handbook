# fin cli info

Prints various details about the FIN-CLI environment.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

Helpful for diagnostic purposes, this command shares:

* OS information.
* Shell information.
* PHP binary used.
* PHP binary version.
* php.ini configuration file used (which is typically different than web).
* FIN-CLI root dir: where FIN-CLI is installed (if non-Phar install).
* FIN-CLI global config: where the global config YAML file is located.
* FIN-CLI project config: where the project config YAML file is located.
* FIN-CLI version: currently installed version.

See [config docs](https://make.wordpress.org/cli/handbook/references/config/) for more details on global and project config YAML files.

### OPTIONS

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: list
options:
  - list
  - json
\---

### EXAMPLES

    # Display various data about the CLI environment.
    $ fin cli info
    OS:  Linux 4.10.0-42-generic #46~16.04.1-Ubuntu SMP Mon Dec 4 15:57:59 UTC 2017 x86_64
    Shell:   /usr/bin/zsh
    PHP binary:  /usr/bin/php
    PHP version: 7.1.12-1+ubuntu16.04.1+deb.sury.org+1
    php.ini used:    /etc/php/7.1/cli/php.ini
    FIN-CLI root dir:    phar://fin-cli.phar
    FIN-CLI packages dir:    /home/person/.fin-cli/packages/
    FIN-CLI global config:
    FIN-CLI project config:
    FIN-CLI version: 1.5.0

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
