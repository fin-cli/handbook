# fin menu location

Assigns, removes, and lists a menu's locations.

### EXAMPLES

    # List available menu locations
    $ fin menu location list
    +----------+-------------------+
    | location | description       |
    +----------+-------------------+
    | primary  | Primary Menu      |
    | social   | Social Links Menu |
    +----------+-------------------+

    # Assign the 'primary-menu' menu to the 'primary' location
    $ fin menu location assign primary-menu primary
    Success: Assigned location primary to menu primary-menu.

    # Remove the 'primary-menu' menu from the 'primary' location
    $ fin menu location remove primary-menu primary
    Success: Removed location from menu.




