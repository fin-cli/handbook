# wp post generate

Generates some posts.

Creates a specified number of new posts with dummy data.

### OPTIONS

[\--count=&lt;number&gt;]
: How many posts to generate?
\---
default: 100
\---

[\--post_type=&lt;type&gt;]
: The type of the generated posts.
\---
default: post
\---

[\--post_status=&lt;status&gt;]
: The status of the generated posts.
\---
default: publish
\---

[\--post_title=&lt;post_title&gt;]
: The post title.
\---
default:
\---

[\--post_author=&lt;login&gt;]
: The author of the generated posts.
\---
default:
\---

[\--post_date=&lt;yyyy-mm-dd-hh-ii-ss&gt;]
: The date of the post. Default is the current time.

[\--post_date_gmt=&lt;yyyy-mm-dd-hh-ii-ss&gt;]
: The date of the post in the GMT timezone. Default is the value of --post_date.

[\--post_content]
: If set, the command reads the post_content from STDIN.

[\--max_depth=&lt;number&gt;]
: For hierarchical post types, generate child posts down to a certain depth.
\---
default: 1
\---

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: progress
options:
  - progress
  - ids
\---

### EXAMPLES

    # Generate posts.
    $ wp post generate --count=10 --post_type=page --post_date=1999-01-04
    Generating posts  100% [================================================] 0:01 / 0:04

    # Generate posts with fetched content.
    $ curl -N https://loripsum.net/api/5 | wp post generate --post_content --count=10
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100  2509  100  2509    0     0    616      0  0:00:04  0:00:04 --:--:--   616
    Generating posts  100% [================================================] 0:01 / 0:04

    # Add meta to every generated posts.
    $ wp post generate --format=ids | xargs -d ' ' -I % wp post meta add % foo bar
    Success: Added custom field.
    Success: Added custom field.
    Success: Added custom field.

### GLOBAL PARAMETERS

These [global parameters](https://make.wordpress.org/cli/handbook/config/) have the same behavior across all commands and affect how WP-CLI interacts with WordPress.

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
| `--debug[=<group>]` | Show all PHP errors and add verbosity to WP-CLI output. Built-in groups include: bootstrap, commandfactory, and help. |
| `--prompt[=<assoc>]` | Prompt the user to enter values for all command arguments, or a subset specified as comma-separated values. |
| `--quiet` | Suppress informational messages. |
