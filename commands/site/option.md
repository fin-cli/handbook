# fin site option

Adds, updates, deletes, and lists site options in a multisite installation.

### EXAMPLES

    # Get site registration
    $ fin site option get registration
    none

    # Add site option
    $ fin site option add my_option foobar
    Success: Added 'my_option' site option.

    # Update site option
    $ fin site option update my_option '{"foo": "bar"}' --format=json
    Success: Updated 'my_option' site option.

    # Delete site option
    $ fin site option delete my_option
    Success: Deleted 'my_option' site option.




