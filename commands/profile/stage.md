# fin profile stage

Profile each stage of the WordPress load process (bootstrap, main_query, template).

This command runs on the `before_fin_load` hook, just before the FIN load process begins.

When WordPress handles a request from a browser, it’s essentially executing as one long PHP script. `fin profile stage` breaks the script into three stages:

* **bootstrap** is where WordPress is setting itself up, loading plugins and the main theme, and firing the `init` hook.
* **main_query** is how WordPress transforms the request (e.g. `/2016/10/21/moms-birthday/`) into the primary FIN_Query.
* **template** is where WordPress determines which theme template to render based on the main query, and renders it.

### OPTIONS

[&lt;stage&gt;]
: Drill down into a specific stage.

[\--all]
: Expand upon all stages.

[\--spotlight]
: Filter out logs with zero-ish values from the set.

[\--url=&lt;url&gt;]
: Execute a request against a specified URL. Defaults to the home URL.

[\--fields=&lt;fields&gt;]
: Limit the output to specific fields. Default is all fields.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - json
  - yaml
  - csv
\---

[\--order=&lt;order&gt;]
: Ascending or Descending order.
\---
default: ASC
options:
  - ASC
  - DESC
\---

[\--orderby=&lt;fields&gt;]
: Set orderby which field.

### EXAMPLES

    # See an overview for each stage of the load process.
    $ fin profile stage --fields=stage,time,cache_ratio
    +------------+---------+-------------+
    | stage      | time    | cache_ratio |
    +------------+---------+-------------+
    | bootstrap  | 0.7994s | 93.21%      |
    | main_query | 0.0123s | 94.29%      |
    | template   | 0.792s  | 91.23%      |
    +------------+---------+-------------+
    | total (3)  | 1.6037s | 92.91%      |
    +------------+---------+-------------+

    # Dive into hook performance for a given stage.
    $ fin profile stage bootstrap --fields=hook,time,cache_ratio --spotlight
    +--------------------------+---------+-------------+
    | hook                     | time    | cache_ratio |
    +--------------------------+---------+-------------+
    | muplugins_loaded:before  | 0.2335s | 40%         |
    | muplugins_loaded         | 0.0007s | 50%         |
    | plugins_loaded:before    | 0.2792s | 77.63%      |
    | plugins_loaded           | 0.1502s | 100%        |
    | after_setup_theme:before | 0.068s  | 100%        |
    | init                     | 0.2643s | 96.88%      |
    | fin_loaded:after          | 0.0377s |             |
    +--------------------------+---------+-------------+
    | total (7)                | 1.0335s | 77.42%      |
    +--------------------------+---------+-------------+

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
