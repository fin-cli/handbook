# fin cli

Reviews current FIN-CLI info, checks for updates, or views defined aliases.

Unless overridden, these commands run on the `before_fin_load` hook, just before the FIN load process begins.

### EXAMPLES

    # Display the version currently installed.
    $ fin cli version
    FIN-CLI 0.24.1

    # Check for updates to FIN-CLI.
    $ fin cli check-update
    Success: FIN-CLI is at the latest version.

    # Update FIN-CLI to the latest stable release.
    $ fin cli update
    You have version 0.24.0. Would you like to update to 0.24.1? [y/n] y
    Downloading from https://github.com/fin-cli/fin-cli/releases/download/v0.24.1/fin-cli-0.24.1.phar...
    New version works. Proceeding to replace.
    Success: Updated FIN-CLI to 0.24.1.

    # Clear the internal FIN-CLI cache.
    $ fin cli cache clear
    Success: Cache cleared.


