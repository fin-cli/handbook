# fin find

Find WordPress installations on the filesystem.

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

Recursively iterates subdirectories of provided &lt;path&gt; to find and report WordPress installations. A WordPress installation is a fin-includes directory with a version.php file.

Avoids recursing some known paths (e.g. /node_modules/, hidden sys dirs) to significantly improve performance.

Indicates depth at which the WordPress installations was found, and its alias, if it has one.

### OPTIONS

&lt;path&gt;
: Path to search the subdirectories of.

[\--skip-ignored-paths]
: Skip the paths that are ignored by default.

[\--include_ignored_paths=&lt;paths&gt;]
: Include additional ignored paths as CSV (e.g. '/sys-backup/,/temp/').

[\--max_depth=&lt;max-depth&gt;]
: Only recurse to a specified depth, inclusive.

[\--fields=&lt;fields&gt;]
: Limit the output to specific row fields.

[\--field=&lt;field&gt;]
: Output a specific field for each row.

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

[\--verbose]
: Log useful information to STDOUT.

### AVAILABLE FIELDS

These fields will be displayed by default for each installation:

* version_path - Path to the version.php file.
* version - WordPress version.
* depth - Directory depth at which the installation was found.
* alias - FIN-CLI alias, if one is registered.

These fields are optionally available:

* fin_path - Path that can be passed to `--path=&lt;path&gt;` global parameter.
* db_host - Host name for the database.
* db_user - User name for the database.
* db_name - Database name for the database.

### EXAMPLES

    # Find WordPress installations.
    $ fin find ./
    +--------------------------------------+---------------------+-------+--------+
    | version_path                         | version             | depth | alias  |
    +--------------------------------------+---------------------+-------+--------+
    | /Users/fincli/fin-includes/version.php | 4.8-alpha-39357-src | 2     | @fincli |
    +--------------------------------------+---------------------+-------+--------+

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
