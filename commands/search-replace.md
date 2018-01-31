# wp search-replace

Searches/replaces strings in the database.

Searches through all rows in a selection of tables and replaces appearances of the first string with the second string.

By default, the command uses tables registered to the `$wpdb` object. On multisite, this will just be the tables for the current site unless `--network` is specified.

Search/replace intelligently handles PHP serialized data, and does not change primary key values.

### OPTIONS

&lt;old&gt;
: A string to search for within the database.

&lt;new&gt;
: Replace instances of the first string with this new string.

[&lt;table&gt;...]
: List of database tables to restrict the replacement to. Wildcards are supported, e.g. `'wp_*options'` or `'wp_post*'`.

[\--dry-run]
: Run the entire search/replace operation and show report, but don't save changes to the database.

[\--network]
: Search/replace through all the tables registered to $wpdb in a multisite install.

[\--all-tables-with-prefix]
: Enable replacement on any tables that match the table prefix even if not registered on $wpdb.

[\--all-tables]
: Enable replacement on ALL tables in the database, regardless of the prefix, and even if not registered on $wpdb. Overrides --network and --all-tables-with-prefix.

[\--export[=&lt;file&gt;]]
: Write transformed data as SQL file instead of saving replacements to the database. If &lt;file&gt; is not supplied, will output to STDOUT.

[\--export_insert_size=&lt;rows&gt;]
: Define number of rows in single INSERT statement when doing SQL export. You might want to change this depending on your database configuration (e.g. if you need to do fewer queries). Default: 50

[\--skip-tables=&lt;tables&gt;]
: Do not perform the replacement on specific tables. Use commas to specify multiple tables.

[\--skip-columns=&lt;columns&gt;]
: Do not perform the replacement on specific columns. Use commas to specify multiple columns.

[\--include-columns=&lt;columns&gt;]
: Perform the replacement on specific columns. Use commas to specify multiple columns.

[\--precise]
: Force the use of PHP (instead of SQL) which is more thorough, but slower.

[\--recurse-objects]
: Enable recursing into objects to replace strings. Defaults to true; pass --no-recurse-objects to disable.

[\--verbose]
: Prints rows to the console as they're updated.

[\--regex]
: Runs the search using a regular expression (without delimiters). Warning: search-replace will take about 15-20x longer when using --regex.

[\--regex-flags=&lt;regex-flags&gt;]
: Pass PCRE modifiers to regex search-replace (e.g. 'i' for case-insensitivity).

[\--regex-delimiter=&lt;regex-delimiter&gt;]
: The delimiter to use for the regex. It must be escaped if it appears in the search string. The default value is the result of `chr(1)`.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - count
\---

[\--report]
: Produce report. Defaults to true.

[\--report-changed-only]
: Report changed fields only. Defaults to false, unless logging, when it defaults to true.

[\--log[=&lt;file&gt;]]
: Log the items changed. If &lt;file&gt; is not supplied or is "-", will output to STDOUT. Warning: causes a significant slow down, similar or worse to enabling --precise or --regex.

[\--before_context=&lt;num&gt;]
: For logging, number of characters to display before the old match and the new replacement. Default 40. Ignored if not logging.

[\--after_context=&lt;num&gt;]
: For logging, number of characters to display after the old match and the new replacement. Default 40. Ignored if not logging.

### EXAMPLES

    # Search and replace but skip one column
    $ wp search-replace 'http://example.dev' 'http://example.com' --skip-columns=guid

    # Run search/replace operation but dont save in database
    $ wp search-replace 'foo' 'bar' wp_posts wp_postmeta wp_terms --dry-run

    # Run case-insensitive regex search/replace operation (slow)
    $ wp search-replace '\[foo id="([0-9]+)"' '[bar id="\1"' --regex --regex-flags='i'

    # Turn your production multisite database into a local dev database
    $ wp search-replace --url=example.com example.com example.dev 'wp_*options' wp_blogs

    # Search/replace to a SQL file without transforming the database
    $ wp search-replace foo bar --export=database.sql

    # Bash script: Search/replace production to development url (multisite compatible)
    #!/bin/bash
    if $(wp --url=http://example.com core is-installed --network); then
        wp search-replace --url=http://example.com 'http://example.com' 'http://example.dev' --recurse-objects --network --skip-columns=guid --skip-tables=wp_users
    else
        wp search-replace 'http://example.com' 'http://example.dev' --recurse-objects --skip-columns=guid --skip-tables=wp_users
    fi

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
