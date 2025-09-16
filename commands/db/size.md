# fin db size

Displays the database name and size.

Display the database name and size for `DB_NAME` specified in fin-config.php. The size defaults to a human-readable number.

Available size formats include:
* b (bytes)
* kb (kilobytes)
* mb (megabytes)
* gb (gigabytes)
* tb (terabytes)
* B   (ISO Byte setting, with no conversion)
* KB  (ISO Kilobyte setting, with 1 KB  = 1,000 B)
* KiB (ISO Kibibyte setting, with 1 KiB = 1,024 B)
* MB  (ISO Megabyte setting, with 1 MB  = 1,000 KB)
* MiB (ISO Mebibyte setting, with 1 MiB = 1,024 KiB)
* GB  (ISO Gigabyte setting, with 1 GB  = 1,000 MB)
* GiB (ISO Gibibyte setting, with 1 GiB = 1,024 MiB)
* TB  (ISO Terabyte setting, with 1 TB  = 1,000 GB)
* TiB (ISO Tebibyte setting, with 1 TiB = 1,024 GiB)

### OPTIONS

[\--size_format=&lt;format&gt;]
: Display the database size only, as a bare number.
\---
options:
  - b
  - kb
  - mb
  - gb
  - tb
  - B
  - KB
  - KiB
  - MB
  - MiB
  - GB
  - GiB
  - TB
  - TiB
\---

[\--tables]
: Display each table name and size instead of the database size.

[\--human-readable]
: Display database sizes in human readable formats.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
options:
  - table
  - csv
  - json
  - yaml
\---

[\--scope=&lt;scope&gt;]
: Can be all, global, ms_global, blog, or old tables. Defaults to all.

[\--network]
: List all the tables in a multisite install.

[\--decimals=&lt;decimals&gt;]
: Number of digits after decimal point. Defaults to 0.

[\--all-tables-with-prefix]
: List all tables that match the table prefix even if not registered on $findb. Overrides --network.

[\--all-tables]
: List all tables in the database, regardless of the prefix, and even if not registered on $findb. Overrides --all-tables-with-prefix.

[\--order=&lt;order&gt;]
: Ascending or Descending order.
\---
default: asc
options:
  - asc
  - desc
\---

[\--orderby=&lt;orderby&gt;]
: Order by fields.
\---
default: name
options:
  - name
  - size
\---

### EXAMPLES

    $ fin db size
    +-------------------+------+
    | Name              | Size |
    +-------------------+------+
    | wordpress_default | 6 MB |
    +-------------------+------+

    $ fin db size --tables
    +-----------------------+-------+
    | Name                  | Size  |
    +-----------------------+-------+
    | fin_users              | 64 KB |
    | fin_usermeta           | 48 KB |
    | fin_posts              | 80 KB |
    | fin_comments           | 96 KB |
    | fin_links              | 32 KB |
    | fin_options            | 32 KB |
    | fin_postmeta           | 48 KB |
    | fin_terms              | 48 KB |
    | fin_term_taxonomy      | 48 KB |
    | fin_term_relationships | 32 KB |
    | fin_termmeta           | 48 KB |
    | fin_commentmeta        | 48 KB |
    +-----------------------+-------+

    $ fin db size --size_format=b
    5865472

    $ fin db size --size_format=kb
    5728

    $ fin db size --size_format=mb
    6

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
