# wp embed provider list

Lists all available oEmbed providers.

### OPTIONS

[\--field=&lt;field&gt;]
: Display the value of a single field

[\--fields=&lt;fields&gt;]
: Limit the output to specific fields.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - csv
  - json
\---

[\--force-regex]
: Turn the asterisk-type provider URLs into regexes.

### AVAILABLE FIELDS

These fields will be displayed by default for each provider:

* format
* endpoint

This field is optionally available:

* regex

### EXAMPLES

    # List format,endpoint fields of available providers.
    $ wp embed provider list --fields=format,endpoint
    +------------------------------+-----------------------------------------+
    | format                       | endpoint                                |
    +------------------------------+-----------------------------------------+
    | #https?://youtu\.be/.*#i     | https://www.youtube.com/oembed          |
    | #https?://flic\.kr/.*#i      | https://www.flickr.com/services/oembed/ |
    | #https?://wordpress\.tv/.*#i | https://wordpress.tv/oembed/            |

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
