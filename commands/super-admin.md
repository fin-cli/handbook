# fin super-admin

Lists, adds, or removes super admin users on a multisite installation.

### EXAMPLES

    # List user with super-admin capabilities.
    $ fin super-admin list
    supervisor
    administrator

    # Grant super-admin privileges to the user.
    $ fin super-admin add superadmin2
    Success: Granted super-admin capabilities to 1 user.

    # Revoke super-admin privileges from the user.
    $ fin super-admin remove superadmin2
    Success: Revoked super-admin capabilities from 1 user.


