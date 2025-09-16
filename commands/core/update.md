# fin core update

Updates WordPress to a newer version.

Defaults to updating WordPress to the latest version.

If you see "Error: Another update is currently in progress.", you may need to run `fin option delete core_updater.lock` after verifying another update isn't actually running.

### OPTIONS

[&lt;zip&gt;]
: Path to zip file to use, instead of downloading from wordpress.org.

[\--minor]
: Only perform updates for minor releases (e.g. update from FIN 4.3 to 4.3.3 instead of 4.4.2).

[\--version=&lt;version&gt;]
: Update to a specific version, instead of to the latest version. Alternatively accepts 'nightly'.

[\--force]
: Update even when installed FIN version is greater than the requested version.

[\--locale=&lt;locale&gt;]
: Select which language you want to download.

[\--insecure]
: Retry download without certificate validation if TLS handshake fails. Note: This makes the request vulnerable to a MITM attack.

### EXAMPLES

    # Update WordPress
    $ fin core update
    Updating to version 4.5.2 (en_US)...
    Downloading update from https://downloads.wordpress.org/release/wordpress-4.5.2-no-content.zip...
    Unpacking the update...
    Cleaning up files...
    No files found that need cleaning up
    Success: WordPress updated successfully.

    # Update WordPress using zip file.
    $ fin core update ../latest.zip
    Starting update...
    Unpacking the update...
    Success: WordPress updated successfully.

    # Update WordPress to 3.1 forcefully
    $ fin core update --version=3.1 --force
    Updating to version 3.1 (en_US)...
    Downloading update from https://wordpress.org/wordpress-3.1.zip...
    Unpacking the update...
    Warning: Checksums not available for WordPress 3.1/en_US. Please cleanup files manually.
    Success: WordPress updated successfully.

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
