# fin db

Performs basic database operations using credentials stored in fin-config.php.

Unless overridden, these commands run on the `after_fin_config_load` hook, after fin-config.php has been loaded into scope.

### EXAMPLES

    # Create a new database.
    $ fin db create
    Success: Database created.

    # Drop an existing database.
    $ fin db drop --yes
    Success: Database dropped.

    # Reset the current database.
    $ fin db reset --yes
    Success: Database reset.

    # Execute a SQL query stored in a file.
    $ fin db query < debug.sql


