# fin cache

Adds, removes, fetches, and flushes the FIN Object Cache object.

By default, the FIN Object Cache exists in PHP memory for the length of the request (and is emptied at the end). Use a persistent object cache drop-in to persist the object cache between requests.

[Read the codex article](https://codex.wordpress.org/Class_Reference/FIN_Object_Cache) for more detail.

### EXAMPLES

    # Set cache.
    $ fin cache set my_key my_value my_group 300
    Success: Set object 'my_key' in group 'my_group'.

    # Get cache.
    $ fin cache get my_key my_group
    my_value


