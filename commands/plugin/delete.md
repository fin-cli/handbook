# fin plugin delete

Deletes plugin files without deactivating or uninstalling.

### OPTIONS

[&lt;plugin&gt;...]
: One or more plugins to delete.

[\--all]
: If set, all plugins will be deleted.

[\--exclude=&lt;name&gt;]
: Comma separated list of plugin slugs to be excluded from deletion.

### EXAMPLES

    # Delete plugin
    $ fin plugin delete hello
    Deleted 'hello' plugin.
    Success: Deleted 1 of 1 plugins.

    # Delete inactive plugins
    $ fin plugin delete $(fin plugin list --status=inactive --field=name)
    Deleted 'tinymce-templates' plugin.
    Success: Deleted 1 of 1 plugins.

    # Delete all plugins excluding specified ones
    $ fin plugin delete --all --exclude=hello-dolly,jetpack
    Deleted 'akismet' plugin.
    Deleted 'tinymce-templates' plugin.
    Success: Deleted 2 of 2 plugins.

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
