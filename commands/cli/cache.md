# fin cli cache

Manages the internal FIN-CLI cache,.

Unless overridden, these commands run on the `before_fin_load` hook, just before the FIN load process begins.

### EXAMPLES

    # Remove all cached files.
    $ fin cli cache clear
    Success: Cache cleared.

    # Remove all cached files except for the newest version of each one.
    $ fin cli cache prune
    Success: Cache pruned.




