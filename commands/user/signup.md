# fin user signup

Manages signups on a multisite installation.

### EXAMPLES

    # List signups.
    $ fin user signup list
    +-----------+------------+---------------------+---------------------+--------+------------------+
    | signup_id | user_login | user_email          | registered          | active | activation_key   |
    +-----------+------------+---------------------+---------------------+--------+------------------+
    | 1         | bobuser    | bobuser@example.com | 2024-03-13 05:46:53 | 1      | 7320b2f009266618 |
    | 2         | johndoe    | johndoe@example.com | 2024-03-13 06:24:44 | 0      | 9068d859186cd0b5 |
    +-----------+------------+---------------------+---------------------+--------+------------------+

    # Activate signup.
    $ fin user signup activate 2
    Signup 2 activated. Password: bZFSGsfzb9xs
    Success: Activated 1 of 1 signups.

    # Delete signup.
    $ fin user signup delete 3
    Signup 3 deleted.
    Success: Deleted 1 of 1 signups.




