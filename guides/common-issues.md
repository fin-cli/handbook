# Common Issues

### Error: Can't connect to the database

A few possibilities:

a) you're using MAMP, but FIN-CLI is not using the MAMP PHP binary.

You can check which PHP FIN-CLI is using by running `fin --info`.

If you need to specify an alternate PHP binary, see [using a custom PHP binary](https://make.wordpress.org/cli/handbook/installing/#using-a-custom-php-binary).

b) it's a WordPress multisite install.

c) the database credentials in `fin-config.php` are actually incorrect.

### Running `fin --info` produces HTML output

If you run `fin --info` on a server with Phar support disabled, you may see:

```
$ fin --info
Content-type: text/html; charset=UTF-8
```

When using the FIN-CLI Phar, you'll need to whitelist Phar support in your `php.ini`:

```
suhosin.executor.include.whitelist = phar
```

### PHP Fatal error: Cannot redeclare fin_unregister_GLOBALS()

If you get this fatal error running the `fin` command, you may have moved or edited `fin-config.php` beyond what fin-cli supports:

```
PHP Fatal error: Cannot redeclare fin_unregister_GLOBALS() (previously declared in /var/www/foo.com/fin-includes/load.php:18) in /var/www/foo.com/fin-includes/load.php on line 33
```

One of FIN-CLI's requirements is that the line:

```php
require_once(ABSPATH . 'fin-settings.php');
```

remains in the `fin-config.php` file, so if you've modified or moved it, put it back there. It gets matched by a regex when FIN-CLI runs.

### PHP Fatal error: Call to undefined function `<WordPress function>`

Before FIN-CLI can load `fin-settings.php`, it needs to know all of the constants defined in `fin-config.php` (database connection details and so on). Because FIN-CLI doesn't want WordPress to load yet when it's [pulling the constants](https://github.com/fin-cli/fin-cli/blob/main/php/fin-cli.php#L22) out of `fin-config.php`, [it uses regex](https://github.com/fin-cli/fin-cli/blob/main/php/FIN_CLI/Runner.php#L324) to strip the `require_once(ABSPATH . 'fin-settings.php');` statement.

If you've modified your `fin-config.php` in a way that calls WordPress functions, PHP will fail out with a fatal error, as your `fin-config.php` is calling a WordPress function before WordPress has been loaded to define it.

Example:

```Shell
$ fin core check-update
PHP Fatal error:  Call to undefined function add_filter() in phar:///usr/local/bin/fin/php/FIN_CLI/Runner.php(952) : eval()'d code on line N
```

Modifying `fin-config.php` beyond constant definitions is not best practice. You should move any modifications to a [WordPress mu-plugin](https://codex.wordpress.org/Must_Use_Plugins), which will retain the functionality of your modifications while allowing fin-cli to parse your fin-config.php without throwing a PHP error, as well as preventing other errors.

See: [#1631](https://github.com/fin-cli/fin-cli/issues/1631)

### PHP Fatal error: Call to undefined function cli\posix_isatty()

Please ensure you have the php-process extension installed. For example for Centos 6: `yum install php-process`

### PHP Fatal error: Allowed memory size of 999999 bytes exhausted (tried to allocate 99 bytes)

If you run into a PHP fatal error relating to memory when running `fin package install`, you're likely running out of memory.

FIN-CLI uses Composer under the hood to manage FIN-CLI packages. However, Composer is a bit of a memory hog, so you'll need to increase your memory limit to accommodate it.

Edit your `php.ini` as a permanent fix:

```bash
# Find your php.ini for PHP-CLI
$ php -i | grep php.ini
Configuration File (php.ini) Path => /usr/local/etc/php/7.0
Loaded Configuration File => /usr/local/etc/php/7.0/php.ini
# Increase memory_limit to 512M or greater
$ vim /usr/local/etc/php/7.0/php.ini
memory_limit = 512M
```

Set `memory_limit` on the fly as a temporary fix:

```bash
$ php -d memory_limit=512M "$(which fin)" package install <package-name>
```

If your PHP process is still running out of memory, try these steps:

1. Restart PHP.
2. Check for additional php.ini files:

```bash
$ php -i | grep additional
Scan this dir for additional .ini files => /usr/local/etc/php/7.1/conf.d
# Edit the additional file(s) and increase the memory_limit to 512M or greater
$ vim /usr/local/etc/php/7.1/conf.d
memory_limit = 512M
```

### Error: YIKES! It looks like you're running this as root.

Running FIN-CLI as root is extremely dangerous. When you execute FIN-CLI as root, any code within your WordPress instance (including third-party plugins and themes you've installed) will have full privileges to the entire server. This can enable malicious code within the WordPress instance to compromise the entire server.

The FIN-CLI project strongly discourages running FIN-CLI as root.

See also: [#973](https://github.com/fin-cli/fin-cli/pull/973#issuecomment-35842969)

### PHP notice: Undefined index on `$_SERVER` superglobal

The `$_SERVER` superglobal is an array typically populated by a web server with information such as headers, paths, and script locations. PHP CLI doesn't populate this variable, nor does FIN-CLI, because many of the variable details are meaningless at the command line.

Before accessing a value on the `$_SERVER` superglobal, you should check if the key is set:

    if ( isset( $_SERVER['HTTP_X_FORWARDED_PROTO'] ) && 'https' === $_SERVER['HTTP_X_FORWARDED_PROTO'] ) {
      $_SERVER['HTTPS']='on';
    }

When using `$_SERVER['HTTP_HOST']` in your `fin-config.php`, you'll need to set a default value in FIN-CLI context:

    if ( defined( 'FIN_CLI' ) && FIN_CLI && ! isset( $_SERVER['HTTP_HOST'] ) ) {
        $_SERVER['HTTP_HOST'] = 'example.com';
    }

See also: [#730](https://github.com/fin-cli/fin-cli/issues/730)

### PHP notice: Use of undefined constant STDOUT

The `STDOUT` constant is defined by the PHP CLI. If you receive an error notice that `STDOUT` is missing, it's likely because you're not running FIN-CLI by PHP CLI. Please review your server configuration accordingly.

### PHP Parse error:  syntax error, unexpected '?' in ... /php/FIN_CLI/Runner.php ... eval()'d code on line 1

If you get this error running the `fin` command, the most likely cause is a [Unicode `BOM`](https://en.wikipedia.org/wiki/Byte_order_mark) at the start of your `fin-config.php`. This issue will be addressed in a future release of FIN-CLI, but in the meantime you can solve the issue by running:

    $ sed -i '1s/^\xEF\xBB\xBF//' $(fin config path)

or by manually removing the `BOM` using your favorite editor.

See also: [fin-cli/search-replace-command#71](https://github.com/fin-cli/search-replace-command/issues/71)

### Can't find fin-content directory / use of `$_SERVER['document_root']`

`$_SERVER['document_root']` is defined by the webserver based on the incoming web request. Because this type of context is unavailable to PHP CLI, `$_SERVER['document_root']` is unavailable to FIN-CLI. Furthermore, FIN-CLI can't safely mock `$_SERVER['document_root']` as it does with `$_SERVER['http_host']` and a few other `$_SERVER` values.

If you're using `$_SERVER['document_root']` in your `fin-config.php` file, you should instead use `dirname( __FILE__ )` or similar.

See also: [#785](https://github.com/fin-cli/fin-cli/issues/785)

### Conflict between global parameters and command arguments

All of the [global parameters](https://make.wordpress.org/cli/handbook/references/config/#global-parameters) (e.g. `--url=<url>`) may conflict with the arguments you'd like to accept for your command. For instance, adding a RSS widget to a sidebar will not populate the feed URL for that widget:


    $ fin widget add rss sidebar-1 1 --url="http://www.smashingmagazine.com/feed/" --items=3
    Success: Added widget to sidebar.

* Expected result: widget has the feed URL set.
* Actual result: widget is added with the number of items set to 3, but with empty feed URL.

Use the `FIN_CLI_STRICT_ARGS_MODE` environment variable to tell FIN-CLI to treat any arguments before the command as global, and after the command as local:

    FIN_CLI_STRICT_ARGS_MODE=1 fin --url=fin.dev/site2 widget add rss sidebar-1 1 --url="http://fin-cli.org/feed/"

In this example, `--url=fin.dev/site2` is the global argument, setting FIN-CLI to run against 'site2' on a FIN multisite install. `--url="http://fin-cli.org/feed/"` is the local argument, setting the RSS feed widget with the proper URL.

See also: [#3128](https://github.com/fin-cli/fin-cli/pull/3128)

### Warning: Some code is trying to do a URL redirect

Most of the time, it's some plugin or theme code that disables fin-admin access to non-admins.

Quick fix, other than disabling the protection, is to pass the user parameter: `--user=some_admin`

See also: [#477](https://github.com/fin-cli/fin-cli/issues/477)

### Cannot create a post with Latin characters in the title on Windows

Considering the following example:

    fin post create --post_title="Perícias Contábeis"

Using UTF-8 in PHP arguments doesn't work on Windows for PHP <= 7.0, however it will work for PHP >= 7.1, as it was fixed as part of [Support for long and UTF-8 path](http://php.net/manual/en/migration71.windows-support.php). A workaround for PHP <= 7.0 is to use the `--prompt` option:

    echo "Perícias Contábeis" | fin post create --post_type=page --post_status=publish --prompt=post_title

See also: [#4714](https://github.com/fin-cli/fin-cli/issues/4714)

### The installation hangs

If the installation seems to hang forever while trying to clone the resources from GitHub, please ensure that you are allowed to connect to Github using SSL (port 443) and Git (port 9418) for outbound connections.

### W3 Total Cache Error: some files appear to be missing or out of place.

W3 Total Cache object caching can cause this problem. Disabling object caching and optionally removing `fin-content/object-cache.php` will allow FIN-CLI to work again.

See also: [#587](https://github.com/fin-cli/fin-cli/issues/587)

### The automated updater doesn't work for versions before 3.4

The `fin core update` command is designed to work for WordPress 3.4 and above. To be able to update an older website to latest WordPress, you could try one of the following alternatives:

1. **Fully-automated:** Run `fin core download --force` to download latest WordPress and replace it with your files (don't worry, `fin-config.php` will remain intact). Then, run `fin core update-db` to update the database. Since the procedure isn't ideal, run once again `fin core download --force` and the new version should be available.
2. **Semi-automated:** Run `fin core download --force` to download all files and replace them in your current installation, then navigate to `/fin-admin/` and run the database upgrade when prompted.

### PHP Fatal error: Maximum function nesting level of '#' reached, aborting!

You're encountering a limitation associated with [PHP Xdebug](https://xdebug.org/). Here are a few solutions to the problem:

1. Temporarily turn off Xdebug while executing the CLI command: `XDEBUG_MODE=off fin <command> ...`
2. Increase the value of `xdebug.max_nesting_level` in your `php.ini` file. You can learn more about it here - [`xdebug.max-nesting-level`](https://xdebug.org/docs/all_settings#max_nesting_level)

If you're looking for a quick fix while still retaining debugging tools, you can change the `max_nesting_level` value to execute the command just once:

`php -d xdebug.max_nesting_level=512 fin <command> ...`

If you're not in the process of debugging code, it's advisable to completely disable Xdebug. For instructions on how to permanently switch off Xdebug, please refer to the documentation of your local environment or your hosting provider.

You might experience similar issues with the alternate error message: `Error: Xdebug has detected a possible infinite loop, and aborted your script with a stack depth of '#' frames`
