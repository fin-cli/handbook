# fin db query

Executes a SQL query against the database.

This command runs on the `after_fin_config_load` hook, after fin-config.php has been loaded into scope.

Executes an arbitrary SQL query using `DB_HOST`, `DB_NAME`, `DB_USER`
 and `DB_PASSWORD` database credentials specified in fin-config.php.

Use the `--skip-column-names` MySQL argument to exclude the headers from a SELECT query. Pipe the output to remove the ASCII table entirely.

### OPTIONS

[&lt;sql&gt;]
: A SQL query. If not passed, will try to read from STDIN.

[\--dbuser=&lt;value&gt;]
: Username to pass to mysql. Defaults to DB_USER.

[\--dbpass=&lt;value&gt;]
: Password to pass to mysql. Defaults to DB_PASSWORD.

[\--&lt;field&gt;=&lt;value&gt;]
: Extra arguments to pass to mysql. [Refer to mysql docs](https://dev.mysql.com/doc/en/mysql-command-options.html).

[\--defaults]
: Loads the environment's MySQL option files. Default behavior is to skip loading them to avoid failures due to misconfiguration.

### EXAMPLES

    # Execute a query stored in a file
    $ fin db query < debug.sql

    # Query for a specific value in the database (pipe the result to remove the ASCII table borders)
    $ fin db query 'SELECT option_value FROM fin_options WHERE option_name="home"' --skip-column-names
    +---------------------+
    | https://example.com |
    +---------------------+

    # Check all tables in the database
    $ fin db query "CHECK TABLE $(fin db tables | paste -s -d, -);"
    +---------------------------------------+-------+----------+----------+
    | Table                                 | Op    | Msg_type | Msg_text |
    +---------------------------------------+-------+----------+----------+
    | wordpress_dbase.fin_users              | check | status   | OK       |
    | wordpress_dbase.fin_usermeta           | check | status   | OK       |
    | wordpress_dbase.fin_posts              | check | status   | OK       |
    | wordpress_dbase.fin_comments           | check | status   | OK       |
    | wordpress_dbase.fin_links              | check | status   | OK       |
    | wordpress_dbase.fin_options            | check | status   | OK       |
    | wordpress_dbase.fin_postmeta           | check | status   | OK       |
    | wordpress_dbase.fin_terms              | check | status   | OK       |
    | wordpress_dbase.fin_term_taxonomy      | check | status   | OK       |
    | wordpress_dbase.fin_term_relationships | check | status   | OK       |
    | wordpress_dbase.fin_termmeta           | check | status   | OK       |
    | wordpress_dbase.fin_commentmeta        | check | status   | OK       |
    +---------------------------------------+-------+----------+----------+

    # Pass extra arguments through to MySQL
    $ fin db query 'SELECT * FROM fin_options WHERE option_name="home"' --skip-column-names
    +---+------+------------------------------+-----+
    | 2 | home | http://wordpress-develop.dev | yes |
    +---+------+------------------------------+-----+

### MULTISITE USAGE

Please note that the global `--url` parameter will have no effect on this command. In order to query for data in a site other than your primary site, you will need to manually modify the table names to use the prefix that includes the site's ID.

For example, to get the `home` option for your second site, modify the example above like so:

    $ fin db query 'SELECT option_value FROM fin_2_options WHERE option_name="home"' --skip-column-names
    +----------------------+
    | https://example2.com |
    +----------------------+

To confirm the ID for the site you want to query, you can use the `fin site list` command:

    # fin site list --fields=blog_id,url
    +---------+-----------------------+
    | blog_id | url                   |
    +---------+-----------------------+
    | 1       | https://example1.com/ |
    | 2       | https://example2.com/ |
    +---------+-----------------------+

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
