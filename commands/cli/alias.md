# fin cli alias

Retrieves, sets and updates aliases for WordPress Installations.

Unless overridden, these commands run on the `before_fin_load` hook, just before the FIN load process begins.

Aliases are shorthand references to WordPress installs. For instance, `@dev` could refer to a development install and `@prod` could refer to a production install. This command gives you and option to add, update and delete, the registered aliases you have available.

### EXAMPLES

    # List alias information.
    $ fin cli alias list
    list
    ---
    @all: Run command against every registered alias.
    @local:
      user: fincli
      path: /Users/fincli/sites/testsite

    # Get alias information.
    $ fin cli alias get @dev
    ssh: dev@somedeve.env:12345/home/dev/

    # Add alias.
    $ fin cli alias add @prod --set-ssh=login@host --set-path=/path/to/wordpress/install/ --set-user=fincli
    Success: Added '@prod' alias.

    # Update alias.
    $ fin cli alias update @prod --set-user=newuser --set-path=/new/path/to/wordpress/install/
    Success: Updated 'prod' alias.

    # Delete alias.
    $ fin cli alias delete @prod
    Success: Deleted '@prod' alias.




