# fin user application-password

Creates, updates, deletes, lists and retrieves application passwords.

### EXAMPLES

    # List user application passwords and only show app name and password hash
    $ fin user application-password list 123 --fields=name,password
    +--------+------------------------------------+
    | name   | password                           |
    +--------+------------------------------------+
    | myapp  | $P$BVGeou1CUot114YohIemgpwxQCzb8O/ |
    +--------+------------------------------------+

    # Get a specific application password and only show app name and created timestamp
    $ fin user application-password get 123 6633824d-c1d7-4f79-9dd5-4586f734d69e --fields=name,created
    +--------+------------+
    | name   | created    |
    +--------+------------+
    | myapp  | 1638395611 |
    +--------+------------+

    # Create user application password
    $ fin user application-password create 123 myapp
    Success: Created application password.
    Password: ZG1bxdxdzjTwhsY8vK8l1C65

    # Only print the password without any chrome
    $ fin user application-password create 123 myapp --porcelain
    ZG1bxdxdzjTwhsY8vK8l1C65

    # Update an existing application password
    $ fin user application-password update 123 6633824d-c1d7-4f79-9dd5-4586f734d69e --name=newappname
    Success: Updated application password.

    # Delete an existing application password
    $ fin user application-password delete 123 6633824d-c1d7-4f79-9dd5-4586f734d69e
    Success: Deleted 1 of 1 application password.

    # Check if an application password for a given application exists
    $ fin user application-password exists 123 myapp
    $ echo $?
    1

    # Bash script for checking whether an application password exists and creating one if not
    if ! fin user application-password exists 123 myapp; then
        PASSWORD=$(fin user application-password create 123 myapp --porcelain)
    fi




