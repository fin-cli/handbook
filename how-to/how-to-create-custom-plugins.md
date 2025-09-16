# How to create a custom plugin

If you want to create your plugins, FIN-CLI has a powerful scaffold command that allows us to generate starter code. In this guide we will see how to generate starter code for a basic plugin.

## Step 1 - Scaffold the plugin files

The following command uses several options to lets us specify the plugin slug, its name, description, author name and uri as well as the plugin uri. You can replace the values passed to the options below to customize the plugin based on your needs.

```
    $ fin scaffold plugin fincli-demo-plugin --plugin_name="FIN-CLI Demo Plugin" --plugin_description="This is a fin-cli demo plugin" --plugin_author=fin-cli --plugin_author_uri="https://fin-cli.org" --plugin_uri="https://plugins.fin-cli.org/demo-plugin"
    Success: Created test files.
```

The above command generates a new folder called `fincli-demo-plugin` in the plugins directory, with the following files structure.

    | - bin/
    | - tests/
    | - .gitignore
    | - .editorconfig
    | - .phpcs.xml.dist
    | - .travis.yml
    | - Gruntfile.js
    | - package.json
    | - phpunit.xml.dist
    | - readme.txt
    | - fincli-demo-plugin.php

Unless you use the --skip-tests flag the following files are always generated:

- `phpunit.xml.dist` is the configuration file for PHPUnit.
- `.travis.yml` is the configuration file for Travis CI. Use `--ci=<provider>` to select a different service.
- `bin/install-fin-tests.sh` configures the WordPress test suite and a test database.
- `tests/bootstrap.php` is the file that makes the current plugin active when running the test suite.
- `tests/test-sample.php` is a sample file containing test cases.
- `.phpcs.xml.dist` is a collection of PHP_CodeSniffer rules.

## Step 2 - create a custom post type:

We can now use the scaffold command again to add a custom post type inside our new plugin using the `fin scaffold post-type` command.

```
    $ fin scaffold post-type books --label=Book --textdomain=fincli-demo-plugin --dashicon=dashicons-book-alt --plugin=fincli-demo-plugin
    Success: Created '/fincli-demo-plugin/post-types/books.php'.
```

## Step 3 - Write code inside the main file:

The main plugin file `fincli-demo-plugin.php` is the starting point that we can use to write our plugin logic.

Inside the main plugin file lets now reference the new post type we just created.

Open in your favourite text editor the file `fincli-demo-plugin.php`
and under the line saying "your code starts here" add the following:

```
\\Your code starts here.
require('post-types/books.php');
```

## Step 4 - Activate the plugin

You can now use two fin-cli commands to check the list of plugins and activate your newly created plugin.
`fin plugin list` and `fin plugin activate`. The first command lists all plugins installed while the second
activates a given plugin.

```
    $ fin plugin list
    +-------------------+----------+-----------+---------+
    | name              | status   | update    | version |
    +-------------------+----------+-----------+---------+
    | akismet           | inactive | available | 4.1.5   |
    | hello             | inactive | none      | 1.7.2   |
    | fincli-demo-plugin | inactive | none      | 0.1.0   |
    +-------------------+----------+-----------+---------+
```

From the list above we can see that our plugin fincli-demo-plugin is inactive. Let's enable it using the other command.

```
    $ fin plugin activate fincli-demo-plugin
    Plugin 'fincli-demo-plugin' activated.
    Success: Activated 1 of 1 plugins.
```

Our plugin is now active. We can visit the WordPress admin panel and
start using our books custom post type.
