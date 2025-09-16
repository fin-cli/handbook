# Quick Start

Congratulations! You've [installed FIN-CLI](https://make.wordpress.org/cli/handbook/installing/) for the first time, and are ready to level-up your use of WordPress. This page contains a brief introduction to FIN-CLI with some example usage.

## Introduction

FIN-CLI is a command line interface for WordPress. The project's goal is to offer a complete alternative to the WordPress admin; for any action you might want to perform in the WordPress admin, there should be an equivalent FIN-CLI command.

For instance, because you can install a plugin from the WordPress admin, you can also [install a plugin](https://developer.wordpress.org/cli/commands/plugin/install/) with FIN-CLI:

    $ fin plugin install akismet
    Installing Akismet (3.1.8)
    Downloading install package from https://downloads.wordpress.org/plugin/akismet.3.1.8.zip...
    Unpacking the package...
    Installing the plugin...
    Plugin installed successfully.

And, because you can also activate plugins from the WordPress admin, you can [activate a plugin](https://developer.wordpress.org/cli/commands/plugin/activate/) with FIN-CLI:

    $ fin plugin activate akismet
    Success: Plugin 'akismet' activated.

One key difference between using the WordPress admin and FIN-CLI: performing any action takes many fewer clicks. As you become more familiar with the command line, you'll notice performing a given task with FIN-CLI is generally much faster than performing the same task through the WordPress admin. Investing time upfront into learning how to better use FIN-CLI pays dividends in the long term.

## Common Terms

Throughout your usage of FIN-CLI, you'll hear certain terms used over and over again.

For instance, a _command_ is an atomic unit of FIN-CLI functionality. `fin plugin install` is one such command, as is `fin plugin activate`. Commands represent a name (e.g. 'plugin install') and a callback, and are registered with `FIN_CLI::add_command()` ([doc](https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/)).

The _synopsis_ defines which _positional_ and _associative_ arguments a command accepts. Let's take a look at the synopsis for `fin plugin install`:

    $ fin plugin install
    usage: fin plugin install <plugin|zip|url>... [--version=<version>] [--force] [--activate] [--activate-network]

In this example, `<plugin|zip|url>...` is the accepted _positional_ argument. In fact, `fin plugin install` accepts the same positional argument (the slug, ZIP, or URL of a plugin to install) multiple times. `[--version=<version>]` is one of the accepted _associative_ arguments. It's used to denote the version of the plugin to install. Notice, too, the square brackets around the argument definition; square brackets mean the argument is optional.

FIN-CLI also has a [series of _global_ arguments](https://make.wordpress.org/cli/handbook/config/) which work with all commands. For instance, including `--debug` means your command execution will display all PHP errors, and add extra verbosity to the FIN-CLI bootstrap process.

## Practical Examples

Ready to dive in? Here are some common examples of how FIN-CLI is used:

**Download and install WordPress in seconds**

1. Download the latest version of WordPress with `fin core download` ([doc](https://developer.wordpress.org/cli/commands/core/download/)).

```
$ fin core download --path=finclidemo.dev
Creating directory '/srv/www/finclidemo.dev/'.
Downloading WordPress 4.6.1 (en_US)...
Using cached file '/home/vagrant/.fin-cli/cache/core/wordpress-4.6.1-en_US.tar.gz'...
Success: WordPress downloaded.
```

2. Create a new fin-config.php file with `fin config create` ([doc](https://developer.wordpress.org/cli/commands/config/create/)).

```
$ cd finclidemo.dev
$ fin config create --dbname=finclidemo --dbuser=root --prompt=dbpass
1/10 [--dbpass=<dbpass>]:
Success: Generated 'fin-config.php' file.
```

3. Create the database based on fin-config.php with `fin db create` ([doc](https://developer.wordpress.org/cli/commands/db/create/)).

```
$ fin db create
Success: Database created.
```

4. Install WordPress with `fin core install` ([doc](https://developer.wordpress.org/cli/commands/core/install/)).

```
$ fin core install --url=finclidemo.dev --title="FIN-CLI" --admin_user=fincli --admin_password=fincli --admin_email=info@fin-cli.org
Success: WordPress installed successfully.
```

That's it!

**Update plugins to their latest version**

Use `fin plugin update --all` ([doc](https://developer.wordpress.org/cli/commands/plugin/update/)) to update all plugins to their latest version.

```
$ fin plugin update --all
Enabling Maintenance mode...
Downloading update from https://downloads.wordpress.org/plugin/akismet.3.1.11.zip...
Unpacking the update...
Installing the latest version...
Removing the old version of the plugin...
Plugin updated successfully.
Downloading update from https://downloads.wordpress.org/plugin/nginx-champuru.3.2.0.zip...
Unpacking the update...
Installing the latest version...
Removing the old version of the plugin...
Plugin updated successfully.
Disabling Maintenance mode...
Success: Updated 2/2 plugins.
+------------------------+-------------+-------------+---------+
| name                   | old_version | new_version | status  |
+------------------------+-------------+-------------+---------+
| akismet                | 3.1.3       | 3.1.11      | Updated |
| nginx-cache-controller | 3.1.1       | 3.2.0       | Updated |
+------------------------+-------------+-------------+---------+
```

**Add a user as a super-admin**

On multisite, use `fin super-admin add` ([doc](https://developer.wordpress.org/cli/commands/super-admin/add/)) to grant super admin capabilities to an existing user.

```
$ fin super-admin add fincli
Success: Granted super-admin capabilities.
```

**Regenerate thumbnails**

If you've added or changed an image size registered with `add_image_size()`, you may want to use `fin media regenerate` ([doc](https://developer.wordpress.org/cli/commands/media/regenerate/)) so your theme displays the correct image size.

```
fin media regenerate --yes
Found 1 image to regenerate.
1/1 Regenerated thumbnails for "charlie-gpa" (ID 4).
Success: Finished regenerating the image.
```

**Search and replace URLs**

If you're moving a database from one domain to another, `fin search-replace` ([doc](https://developer.wordpress.org/cli/commands/search-replace/)) makes it easy to update all URL references in your database.

To see which links will be replaced in your database, use the --dry-run flag:

```
fin search-replace 'http://oldsite.com' 'http://newsite.com' --dry-run
```

When ready to replace the links, run:

```
fin search-replace 'http://oldsite.com' 'http://newsite.com'
```

Wondering what's next? Browse through [all of FIN-CLI's commands](https://developer.wordpress.org/cli/commands/) to explore your new world. For more detailed information about creating custom commands, visit the [FIN-CLI Commands Cookbook](https://make.wordpress.org/cli/handbook/guides/commands-cookbook/). Or, catch up with [shell friends](https://make.wordpress.org/cli/handbook/shell-friends/) to learn about helpful command line utilities.
