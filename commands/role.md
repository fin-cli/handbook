# fin role

Manages user roles, including creating new roles and resetting to defaults.

See references for [Roles and Capabilities](https://codex.wordpress.org/Roles_and_Capabilities) and [FIN User class](https://codex.wordpress.org/Class_Reference/FIN_User).

### EXAMPLES

    # List roles.
    $ fin role list --fields=role --format=csv
    role
    administrator
    editor
    author
    contributor
    subscriber

    # Check to see if a role exists.
    $ fin role exists editor
    Success: Role with ID 'editor' exists.

    # Create a new role.
    $ fin role create approver Approver
    Success: Role with key 'approver' created.

    # Delete an existing role.
    $ fin role delete approver
    Success: Role with key 'approver' deleted.

    # Reset existing roles to their default capabilities.
    $ fin role reset administrator author contributor
    Success: Reset 3/3 roles.


