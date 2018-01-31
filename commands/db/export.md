# wp db export

Exports the database to a file or to STDOUT.

Runs `mysqldump` utility using `DB_HOST`, `DB_NAME`, `DB_USER` and `DB_PASSWORD` database credentials specified in wp-config.php.

### OPTIONS

[&lt;file&gt;]
: The name of the SQL file to export. If '-', then outputs to STDOUT. If omitted, it will be '{dbname}-{Y-m-d}-{random-hash}.sql'.

[\--dbuser=&lt;value&gt;]
: Username to pass to mysqldump. Defaults to DB_USER.

[\--dbpass=&lt;value&gt;]
: Password to pass to mysqldump. Defaults to DB_PASSWORD.

[\--&lt;field&gt;=&lt;value&gt;]
: Extra arguments to pass to mysqldump.

[\--tables=&lt;tables&gt;]
: The comma separated list of specific tables to export. Excluding this parameter will export all tables in the database.

[\--exclude_tables=&lt;tables&gt;]
: The comma separated list of specific tables that should be skipped from exporting. Excluding this parameter will export all tables in the database.

[\--porcelain]
: Output filename for the exported database.

### EXAMPLES

    # Export database with drop query included
    $ wp db export --add-drop-table
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Export certain tables
    $ wp db export --tables=wp_options,wp_users
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Export all tables matching a wildcard
    $ wp db export --tables=$(wp db tables 'wp_user*' --format=csv)
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Export all tables matching prefix
    $ wp db export --tables=$(wp db tables --all-tables-with-prefix --format=csv)
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Skip certain tables from the exported database
    $ wp db export --exclude_tables=wp_options,wp_users
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Skip all tables matching a wildcard from the exported database
    $ wp db export --exclude_tables=$(wp db tables 'wp_user*' --format=csv)
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Skip all tables matching prefix from the exported database
    $ wp db export --exclude_tables=$(wp db tables --all-tables-with-prefix --format=csv)
    Success: Exported to 'wordpress_dbase-db72bb5.sql'.

    # Export database to STDOUT.
    $ wp db export -
    -- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
    --
    -- Host: localhost    Database: wpdev
    -- ------------------------------------------------------
    -- Server version	5.7.19
    ...

### GLOBAL PARAMETERS

These [global parameters](https://make.wordpress.org/cli/handbook/config/) have the same behavior across all commands and affect how WP-CLI interacts with WordPress.

| **Argument**    | **Description**              |
|:----------------|:-----------------------------|
| `--path=<path>` | Path to the WordPress files. |
| `--url=<url>` | Pretend request came from given URL. In multisite, this argument is how the target site is specified. |
| `--ssh=[<scheme>:][<user>@]<host\|container>[:<port>][<path>]` | Perform operation against a remote server over SSH (or a container using scheme of "docker", "docker-compose", "vagrant"). |
| `--http=<http>` | Perform operation against a remote WordPress install over HTTP. |
| `--user=<id\|login\|email>` | Set the WordPress user. |
| `--skip-plugins[=<plugin>]` | Skip loading all or some plugins. Note: mu-plugins are still loaded. |
| `--skip-themes[=<theme>]` | Skip loading all or some themes. |
| `--skip-packages` | Skip loading all installed packages. |
| `--require=<path>` | Load PHP file before running the command (may be used more than once). |
| `--[no-]color` | Whether to colorize the output. |
| `--debug[=<group>]` | Show all PHP errors; add verbosity to WP-CLI bootstrap. |
| `--prompt[=<assoc>]` | Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values. |
| `--quiet` | Suppress informational messages. |
