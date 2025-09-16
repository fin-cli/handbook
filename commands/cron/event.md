# fin cron event

Schedules, runs, and deletes FIN-Cron events.

### EXAMPLES

    # Schedule a new cron event
    $ fin cron event schedule cron_test
    Success: Scheduled event with hook 'cron_test' for 2016-05-31 10:19:16 GMT.

    # Run all cron events due right now
    $ fin cron event run --due-now
    Executed the cron event 'cron_test_1' in 0.01s.
    Executed the cron event 'cron_test_2' in 0.006s.
    Success: Executed a total of 2 cron events.

    # Delete all scheduled cron events for the given hook
    $ fin cron event delete cron_test
    Success: Deleted a total of 2 cron events.

    # List scheduled cron events in JSON
    $ fin cron event list --fields=hook,next_run --format=json
    [{"hook":"fin_version_check","next_run":"2016-05-31 10:15:13"},{"hook":"fin_update_plugins","next_run":"2016-05-31 10:15:13"},{"hook":"fin_update_themes","next_run":"2016-05-31 10:15:14"}]




