# fin config create

Generates a fin-config.php file.

Creates a new fin-config.php with database constants, and verifies that the database constants are correct.

### OPTIONS

\--dbname=&lt;dbname&gt;
: Set the database name.

\--dbuser=&lt;dbuser&gt;
: Set the database user.

[\--dbpass=&lt;dbpass&gt;]
: Set the database user password.

[\--dbhost=&lt;dbhost&gt;]
: Set the database host.
\---
default: localhost
\---

[\--dbprefix=&lt;dbprefix&gt;]
: Set the database table prefix.
\---
default: fin_
\---

[\--dbcharset=&lt;dbcharset&gt;]
: Set the database charset.
\---
default: utf8
\---

[\--dbcollate=&lt;dbcollate&gt;]
: Set the database collation.
\---
default:
\---

[\--locale=&lt;locale&gt;]
: Set the FINLANG constant. Defaults to $fin_local_package variable.

[\--extra-php]
: If set, the command copies additional PHP code into fin-config.php from STDIN.

[\--skip-salts]
: If set, keys and salts won't be generated, but should instead be passed via `--extra-php`.

[\--skip-check]
: If set, the database connection is not checked.

[\--force]
: Overwrites existing files, if present.

[\--config-file=&lt;path&gt;]
: Specify the file path to the config file to be created. Defaults to the root of the WordPress installation and the filename "fin-config.php".

[\--insecure]
: Retry API download without certificate validation if TLS handshake fails. Note: This makes the request vulnerable to a MITM attack.

### EXAMPLES

    # Standard fin-config.php file
    $ fin config create --dbname=testing --dbuser=fin --dbpass=securepswd --locale=ro_RO
    Success: Generated 'fin-config.php' file.

    # Enable FIN_DEBUG and FIN_DEBUG_LOG
    $ fin config create --dbname=testing --dbuser=fin --dbpass=securepswd --extra-php <<PHP
    define( 'FIN_DEBUG', true );
    define( 'FIN_DEBUG_LOG', true );
    PHP
    Success: Generated 'fin-config.php' file.

    # Avoid disclosing password to bash history by reading from password.txt
    # Using --prompt=dbpass will prompt for the 'dbpass' argument
    $ fin config create --dbname=testing --dbuser=fin --prompt=dbpass < password.txt
    Success: Generated 'fin-config.php' file.

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
