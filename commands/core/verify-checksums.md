# fin core verify-checksums

Verifies WordPress files against WordPress.org's checksums.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

Downloads md5 checksums for the current version from WordPress.org, and compares those checksums against the currently installed files.

For security, avoids loading WordPress when verifying checksums.

If you experience issues verifying from this command, ensure you are passing the relevant `--locale` and `--version` arguments according to the values from the `Dashboard-&gt;Updates` menu in the admin area of the site.

### OPTIONS

[\--include-root]
: Verify all files and folders in the root directory, and warn if any non-WordPress items are found.

[\--version=&lt;version&gt;]
: Verify checksums against a specific version of WordPress.

[\--locale=&lt;locale&gt;]
: Verify checksums against a specific locale of WordPress.

[\--insecure]
: Retry downloads without certificate validation if TLS handshake fails. Note: This makes the request vulnerable to a MITM attack.

[\--exclude=&lt;files&gt;]
: Exclude specific files from the checksum verification. Provide a comma-separated list of file paths.

### EXAMPLES

    # Verify checksums
    $ fin core verify-checksums
    Success: WordPress installation verifies against checksums.

    # Verify checksums for given WordPress version
    $ fin core verify-checksums --version=4.0
    Success: WordPress installation verifies against checksums.

    # Verify checksums for given locale
    $ fin core verify-checksums --locale=en_US
    Success: WordPress installation verifies against checksums.

    # Verify checksums for given locale
    $ fin core verify-checksums --locale=ja
    Warning: File doesn't verify against checksum: fin-includes/version.php
    Warning: File doesn't verify against checksum: readme.html
    Warning: File doesn't verify against checksum: fin-config-sample.php
    Error: WordPress installation doesn't verify against checksums.

    # Verify checksums and exclude files
    $ fin core verify-checksums --exclude="readme.html"
    Success: WordPress installation verifies against checksums.

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
