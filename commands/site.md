# fin site

Creates, deletes, empties, moderates, and lists one or more sites on a multisite installation.

### EXAMPLES

    # Create site
    $ fin site create --slug=example
    Success: Site 3 created: www.example.com/example/

    # Output a simple list of site URLs
    $ fin site list --field=url
    http://www.example.com/
    http://www.example.com/subdir/

    # Delete site
    $ fin site delete 123
    Are you sure you want to delete the 'http://www.example.com/example' site? [y/n] y
    Success: The site at 'http://www.example.com/example' was deleted.


