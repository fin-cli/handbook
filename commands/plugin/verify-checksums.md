# wp plugin verify-checksums

Verifies plugin files against WordPress.org's checksums.

### OPTIONS

[&lt;plugin&gt;...]
: One or more plugins to verify.

[\--all]
: If set, all plugins will be verified.

[\--strict]
: If set, even "soft changes" like readme.txt changes will trigger checksum errors.

[\--version=&lt;version&gt;]
: Verify checksums against a specific plugin version.

[\--format=&lt;format&gt;]
: Render output in a specific format.
\---
default: table
options:
  - table
  - json
  - csv
  - yaml
  - count
\---

[\--insecure]
: Retry downloads without certificate validation if TLS handshake fails. Note: This makes the request vulnerable to a MITM attack.

[\--exclude=&lt;name&gt;]
: Comma separated list of plugin names that should be excluded from verifying.

### EXAMPLES

    # Verify the checksums of all installed plugins
    $ wp plugin verify-checksums --all
    Success: Verified 8 of 8 plugins.

    # Verify the checksums of a single plugin, Akismet in this case
    $ wp plugin verify-checksums akismet
    Success: Verified 1 of 1 plugins.

### GLOBAL PARAMETERS

These [global parameters](https://make.wordpress.org/cli/handbook/config/) have the same behavior across all commands and affect how WP-CLI interacts with WordPress.

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
| `--debug[=<group>]` | Show all PHP errors and add verbosity to WP-CLI output. Built-in groups include: bootstrap, commandfactory, and help. |
| `--prompt[=<assoc>]` | Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values. |
| `--quiet` | Suppress informational messages. |
