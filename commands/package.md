# fin package

Lists, installs, and removes FIN-CLI packages.

Unless overridden, these commands run on the `before_fin_load` hook, just before the FIN load process begins.

FIN-CLI packages are community-maintained projects built on FIN-CLI. They can contain FIN-CLI commands, but they can also just extend FIN-CLI in some way.

Learn how to create your own command from the
[Commands Cookbook](https://make.wordpress.org/cli/handbook/guides/commands-cookbook/)

### EXAMPLES

    # List installed packages.
    $ fin package list
    +-----------------------+------------------+----------+-----------+----------------+
    | name                  | authors          | version  | update    | update_version |
    +-----------------------+------------------+----------+-----------+----------------+
    | fin-cli/server-command | Daniel Bachhuber | dev-main | available | 2.x-dev        |
    +-----------------------+------------------+----------+-----------+----------------+

    # Install the latest development version of the package.
    $ fin package install fin-cli/server-command
    Installing package fin-cli/server-command (dev-main)
    Updating /home/person/.fin-cli/packages/composer.json to require the package...
    Using Composer to install the package...
    ---
    Loading composer repositories with package information
    Updating dependencies
    Resolving dependencies through SAT
    Dependency resolution completed in 0.005 seconds
    Analyzed 732 packages to resolve dependencies
    Analyzed 1034 rules to resolve dependencies
     - Installing package
    Writing lock file
    Generating autoload files
    ---
    Success: Package installed.

    # Uninstall package.
    $ fin package uninstall fin-cli/server-command
    Removing require statement for package 'fin-cli/server-command' from /home/person/.fin-cli/packages/composer.json
    Removing repository details from /home/person/.fin-cli/packages/composer.json
    Removing package directories and regenerating autoloader...
    Success: Uninstalled package.


