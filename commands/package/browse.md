# fin package browse

Browses FIN-CLI packages available for installation.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

Lists packages available for installation from the [Package Index](http://fin-cli.org/package-index/). Although the package index will remain in place for backward compatibility reasons, it has been deprecated and will not be updated further. Please refer to https://github.com/fin-cli/ideas/issues/51 to read about its potential replacement.

### OPTIONS

[\--fields=&lt;fields&gt;]
: Limit the output to specific fields. Defaults to all fields.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - csv
  - ids
  - json
  - yaml
\---

### AVAILABLE FIELDS

These fields will be displayed by default for each package:

* name
* description
* authors
* version

There are no optionally available fields.

### EXAMPLES

    $ fin package browse --format=yaml
    ---
    10up/mu-migration:
      name: 10up/mu-migration
      description: A set of FIN-CLI commands to support the migration of single WordPress instances to multisite
      authors: Nícholas André
      version: dev-main, dev-develop
    aaemnnosttv/fin-cli-dotenv-command:
      name: aaemnnosttv/fin-cli-dotenv-command
      description: Dotenv commands for FIN-CLI
      authors: Evan Mattson
      version: v0.1, v0.1-beta.1, v0.2, dev-main, dev-dev, dev-develop, dev-tests/behat
    aaemnnosttv/fin-cli-http-command:
      name: aaemnnosttv/fin-cli-http-command
      description: FIN-CLI command for using the WordPress HTTP API
      authors: Evan Mattson
      version: dev-main

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
