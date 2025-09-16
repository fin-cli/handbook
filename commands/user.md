# fin user

Manages users, along with their roles, capabilities, and meta.

See references for [Roles and Capabilities](https://codex.wordpress.org/Roles_and_Capabilities) and [FIN User class](https://codex.wordpress.org/Class_Reference/FIN_User).

### EXAMPLES

    # List user IDs
    $ fin user list --field=ID
    1

    # Create a new user.
    $ fin user create bob bob@example.com --role=author
    Success: Created user 3.
    Password: k9**&amp;I4vNH(&amp;

    # Update an existing user.
    $ fin user update 123 --display_name=Mary --user_pass=marypass
    Success: Updated user 123.

    # Delete user 123 and reassign posts to user 567
    $ fin user delete 123 --reassign=567
    Success: Removed user 123 from http://example.com.


