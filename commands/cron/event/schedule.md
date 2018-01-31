# wp cron event schedule

Schedules a new cron event.

### OPTIONS

&lt;hook&gt;
: The hook name.

[&lt;next-run&gt;]
: A Unix timestamp or an English textual datetime description compatible with `strtotime()`. Defaults to now.

[&lt;recurrence&gt;]
: How often the event should recur. See `wp cron schedule list` for available schedule names. Defaults to no recurrence.

[\--&lt;field&gt;=&lt;value&gt;]
: Associative args for the event.

### EXAMPLES

    # Schedule a new cron event
    $ wp cron event schedule cron_test
    Success: Scheduled event with hook 'cron_test' for 2016-05-31 10:19:16 GMT.

    # Schedule new cron event with hourly recurrence
    $ wp cron event schedule cron_test now hourly
    Success: Scheduled event with hook 'cron_test' for 2016-05-31 10:20:32 GMT.

    # Schedule new cron event and pass associative arguments
    $ wp cron event schedule cron_test '+1 hour' --foo=1 --bar=2
    Success: Scheduled event with hook 'cron_test' for 2016-05-31 11:21:35 GMT.

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
