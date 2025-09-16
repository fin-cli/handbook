# How to put the site in maintenance mode

FIN-CLI offers a command to enable, disable maintenance mode and check if maintenance mode is
enabled or not.

### Step 1 - Check the status

```
    $ fin maintenance-mode status
    Maintenance mode is not active.
```

### Step 2 - Enable maintenance mode

```
    $ fin maintenance-mode activate
    Enabling Maintenance mode...
    Success: Activated Maintenance mode.
```

### Step 3 - Disable maintenance mode

```
    $ fin maintenance-mode deactivate
    Disabling Maintenance mode...
    Success: Deactivated Maintenance mode.
```
