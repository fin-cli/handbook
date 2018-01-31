# wp embed fetch

Attempts to convert a URL into embed HTML.

In non-raw mode, starts by checking the URL against the regex of the registered embed handlers. If none of the regex matches and it's enabled, then the URL will be given to the WP_oEmbed class.

In raw mode, checks the providers directly and returns the data.

### OPTIONS

&lt;url&gt;
: URL to retrieve oEmbed data for.

[\--width=&lt;width&gt;]
: Width of the embed in pixels.

[\--height=&lt;height&gt;]
: Height of the embed in pixels.

[\--post-id=&lt;id&gt;]
: Cache oEmbed response for a given post.

[\--discover]
: Enable oEmbed discovery. Defaults to true.

[\--skip-cache]
: Ignore already cached oEmbed responses. Has no effect if using the 'raw' option, which doesn't use the cache.

[\--skip-sanitization]
: Remove the filter that WordPress from 4.4 onwards uses to sanitize oEmbed responses. Has no effect if using the 'raw' option, which by-passes sanitization.

[\--do-shortcode]
: If the URL is handled by a registered embed handler and returns a shortcode, do shortcode and return result. Has no effect if using the 'raw' option, which by-passes handlers.

[\--limit-response-size=&lt;size&gt;]
: Limit the size of the resulting HTML when using discovery. Default 150 KB (the standard WordPress limit). Not compatible with 'no-discover'.

[\--raw]
: Return the raw oEmbed response instead of the resulting HTML. Ignores the cache and does not sanitize responses or use registered embed handlers.

[\--raw-format=&lt;json|xml&gt;]
: Render raw oEmbed data in a particular format. Defaults to json. Can only be specified in conjunction with the 'raw' option.
\---
options:
  - json
  - xml
\---

### EXAMPLES

    # Get embed HTML for a given URL.
    $ wp embed fetch https://www.youtube.com/watch?v=dQw4w9WgXcQ
    &lt;iframe width="525" height="295" src="https://www.youtube.com/embed/dQw4w9WgXcQ?feature=oembed" ...

    # Get raw oEmbed data for a given URL.
    $ wp embed fetch https://www.youtube.com/watch?v=dQw4w9WgXcQ --raw
    {"author_url":"https:\/\/www.youtube.com\/user\/RickAstleyVEVO","width":525,"version":"1.0", ...

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
