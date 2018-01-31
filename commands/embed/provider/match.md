# wp embed provider match

Gets the matching provider for a given URL.

### OPTIONS

&lt;url&gt;
: URL to retrieve provider for.

[\--discover]
: Whether to use oEmbed discovery or not. Defaults to true.

[\--limit-response-size=&lt;size&gt;]
: Limit the size of the resulting HTML when using discovery. Default 150 KB (the standard WordPress limit). Not compatible with 'no-discover'.

[\--link-type=&lt;json|xml&gt;]
: Whether to accept only a certain link type when using discovery. Defaults to any (json or xml), preferring json. Not compatible with 'no-discover'.
\---
options:
  - json
  - xml
\---

### EXAMPLES

    # Get the matching provider for the URL.
    $ wp embed provider match https://www.youtube.com/watch?v=dQw4w9WgXcQ
    https://www.youtube.com/oembed

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
