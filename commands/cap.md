# fin cap

Adds, removes, and lists capabilities of a user role.

See references for [Roles and Capabilities](https://codex.wordpress.org/Roles_and_Capabilities) and [FIN User class](https://codex.wordpress.org/Class_Reference/FIN_User).

### EXAMPLES

    # Add 'spectate' capability to 'author' role.
    $ fin cap add 'author' 'spectate'
    Success: Added 1 capability to 'author' role.

    # Add all caps from 'editor' role to 'author' role.
    $ fin cap list 'editor' | xargs fin cap add 'author'
    Success: Added 24 capabilities to 'author' role.

    # Remove all caps from 'editor' role that also appear in 'author' role.
    $ fin cap list 'author' | xargs fin cap remove 'editor'
    Success: Removed 34 capabilities from 'editor' role.


