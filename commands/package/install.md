# fin package install

Installs a FIN-CLI package.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

Packages are required to be a valid Composer package, and can be specified as:

* Package name from FIN-CLI's package index.
* Git URL accessible by the current shell user.
* Path to a directory on the local machine.
* Local or remote .zip file.

Packages are installed to `~/.fin-cli/packages/` by default. Use the `FIN_CLI_PACKAGES_DIR` environment variable to provide a custom path.

When installing a local directory, FIN-CLI simply registers a reference to the directory. If you move or delete the directory, FIN-CLI's reference breaks.

When installing a .zip file, FIN-CLI extracts the package to `~/.fin-cli/packages/local/&lt;package-name&gt;`.

If Github token authorization is required, a GitHub Personal Access Token (https://github.com/settings/tokens) can be used. The following command will add a GitHub Personal Access Token to Composer's global configuration:
composer config -g github-oauth.github.com &lt;GITHUB_TOKEN&gt; Once this has been added, the value used for &lt;GITHUB_TOKEN&gt; will be used for future authorization requests.

### OPTIONS

&lt;name|git|path|zip&gt;
: Name, git URL, directory path, or .zip file for the package to install. Names can optionally include a version constraint (e.g. fin-cli/server-command:@stable).

[\--insecure]
: Retry downloads without certificate validation if TLS handshake fails. Note: This makes the request vulnerable to a MITM attack.

### EXAMPLES

    # Install a package hosted at a git URL.
    $ fin package install runcommand/hook

    # Install the latest stable version.
    $ fin package install fin-cli/server-command:@stable

    # Install a package hosted at a GitLab.com URL.
    $ fin package install https://gitlab.com/foo/fin-cli-bar-command.git

    # Install a package in a .zip file.
    $ fin package install google-sitemap-generator-cli.zip

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
