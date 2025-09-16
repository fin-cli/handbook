# fin user list

Lists users.

Display WordPress users based on all arguments supported by
[FIN_User_Query()](https://developer.wordpress.org/reference/classes/fin_user_query/prepare_query/).

### OPTIONS

[\--role=&lt;role&gt;]
: Only display users with a certain role.

[\--&lt;field&gt;=&lt;value&gt;]
: Control output by one or more arguments of FIN_User_Query().

[\--network]
: List all users in the network for multisite.

[\--field=&lt;field&gt;]
: Prints the value of a single field for each user.

[\--fields=&lt;fields&gt;]
: Limit the output to specific object fields.

[\--format=&lt;format&gt;]
: Render output in a particular format.
\---
default: table
options:
  - table
  - csv
  - ids
  - json
  - count
  - yaml
\---

### AVAILABLE FIELDS

These fields will be displayed by default for each user:

* ID
* user_login
* display_name
* user_email
* user_registered
* roles

These fields are optionally available:

* user_pass
* user_nicename
* user_url
* user_activation_key
* user_status
* spam
* deleted
* caps
* cap_key
* allcaps
* filter
* url

### EXAMPLES

    # List user IDs
    $ fin user list --field=ID
    1

    # List users with administrator role
    $ fin user list --role=administrator --format=csv
    ID,user_login,display_name,user_email,user_registered,roles
    1,supervisor,supervisor,supervisor@gmail.com,"2016-06-03 04:37:00",administrator

    # List users with only given fields
    $ fin user list --fields=display_name,user_email --format=json
    [{"display_name":"supervisor","user_email":"supervisor@gmail.com"}]

    # List users ordered by the 'last_activity' meta value.
    $ fin user list --meta_key=last_activity --orderby=meta_value_num

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
