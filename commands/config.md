# fin config

Generates and reads the fin-config.php file.

### EXAMPLES

    # Create standard fin-config.php file.
    $ fin config create --dbname=testing --dbuser=fin --dbpass=securepswd --locale=ro_RO
    Success: Generated 'fin-config.php' file.

    # List constants and variables defined in fin-config.php file.
    $ fin config list
    +------------------+------------------------------------------------------------------+----------+
    | key              | value                                                            | type     |
    +------------------+------------------------------------------------------------------+----------+
    | table_prefix     | fin_                                                              | variable |
    | DB_NAME          | fin_cli_test                                                      | constant |
    | DB_USER          | root                                                             | constant |
    | DB_PASSWORD      | root                                                             | constant |
    | AUTH_KEY         | r6+@shP1yO&amp;$)1gdu.hl[/j;7Zrvmt~o;#WxSsa0mlQOi24j2cR,7i+QM/#7S:o^ | constant |
    | SECURE_AUTH_KEY  | iO-z!_m--YH$Tx2tf/&amp;V,YW*13Z_HiRLqi)d?$o-tMdY+82pK$`T.NYW~iTLW;xp | constant |
    +------------------+------------------------------------------------------------------+----------+

    # Get fin-config.php file path.
    $ fin config path
    /home/person/htdocs/project/fin-config.php

    # Get the table_prefix as defined in fin-config.php file.
    $ fin config get table_prefix
    fin_

    # Set the FIN_DEBUG constant to true.
    $ fin config set FIN_DEBUG true --raw
    Success: Updated the constant 'FIN_DEBUG' in the 'fin-config.php' file with the raw value 'true'.

    # Delete the COOKIE_DOMAIN constant from the fin-config.php file.
    $ fin config delete COOKIE_DOMAIN
    Success: Deleted the constant 'COOKIE_DOMAIN' from the 'fin-config.php' file.

    # Launch system editor to edit fin-config.php file.
    $ fin config edit

    # Check whether the DB_PASSWORD constant exists in the fin-config.php file.
    $ fin config has DB_PASSWORD
    $ echo $?
    0

    # Assert if MULTISITE is true.
    $ fin config is-true MULTISITE
    $ echo $?
    0

    # Get new salts for your fin-config.php file.
    $ fin config shuffle-salts
    Success: Shuffled the salt keys.


