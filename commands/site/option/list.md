# fin site option list

Lists site options.

### OPTIONS

[\--search=&lt;pattern&gt;]
: Use wildcards ( * and ? ) to match option name.

[\--site_id=&lt;id&gt;]
: Limit options to those of a particular site id.

[\--field=&lt;field&gt;]
: Prints the value of a single field.

[\--fields=&lt;fields&gt;]
: Limit the output to specific object fields.

[\--format=&lt;format&gt;]
: The serialization format for the value. total_bytes displays the total size of matching options in bytes.
\---
default: table
options:
  - table
  - json
  - csv
  - count
  - yaml
  - total_bytes
\---

### AVAILABLE FIELDS

This field will be displayed by default for each matching option:

* meta_key
* meta_value

These fields are optionally available:

* meta_id
* site_id
* size_bytes

### EXAMPLES

    # List all site options beginning with "i2f_"
    $ fin site option list --search="i2f_*"
    +-------------+--------------+
    | meta_key    | meta_value   |
    +-------------+--------------+
    | i2f_version | 0.1.0        |
    +-------------+--------------+

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
