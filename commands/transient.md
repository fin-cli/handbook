# fin transient

Adds, gets, and deletes entries in the WordPress Transient Cache.

By default, the transient cache uses the WordPress database to persist values between requests. On a single site installation, values are stored in the `fin_options` table. On a multisite installation, values are stored in the `fin_options` or the `fin_sitemeta` table, depending on use of the `--network` flag.

When a persistent object cache drop-in is installed (e.g. Redis or Memcached), the transient cache skips the database and simply wraps the FIN Object Cache.

### EXAMPLES

    # Set transient.
    $ fin transient set sample_key "test data" 3600
    Success: Transient added.

    # Get transient.
    $ fin transient get sample_key
    test data

    # Delete transient.
    $ fin transient delete sample_key
    Success: Transient deleted.

    # Delete expired transients.
    $ fin transient delete --expired
    Success: 12 expired transients deleted from the database.

    # Delete all transients.
    $ fin transient delete --all
    Success: 14 transients deleted from the database.


