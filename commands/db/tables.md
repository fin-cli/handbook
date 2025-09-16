# fin db tables

Lists the database tables.

Defaults to all tables registered to the $findb database handler.

### OPTIONS

[&lt;table&gt;...]
: List tables based on wildcard search, e.g. 'fin_*_options' or 'fin_post?'.

[\--scope=&lt;scope&gt;]
: Can be all, global, ms_global, blog, or old tables. Defaults to all.

[\--network]
: List all the tables in a multisite install.

[\--all-tables-with-prefix]
: List all tables that match the table prefix even if not registered on $findb. Overrides --network.

[\--all-tables]
: List all tables in the database, regardless of the prefix, and even if not registered on $findb. Overrides --all-tables-with-prefix.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: list
options:
  - list
  - csv
\---

### EXAMPLES

    # List tables for a single site, without shared tables like 'fin_users'
    $ fin db tables --scope=blog --url=sub.example.com
    fin_3_posts
    fin_3_comments
    fin_3_options
    fin_3_postmeta
    fin_3_terms
    fin_3_term_taxonomy
    fin_3_term_relationships
    fin_3_termmeta
    fin_3_commentmeta

    # Export only tables for a single site
    $ fin db export --tables=$(fin db tables --url=sub.example.com --format=csv)
    Success: Exported to wordpress_dbase.sql

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
