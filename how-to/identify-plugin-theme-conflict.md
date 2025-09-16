# Identify a Plugin or Theme Conflict

Is FIN-CLI not working with your WordPress install, but you don't know why? It might be a plugin or theme conflicting with the FIN-CLI load process.

To verify, first run `fin --skip-plugins --skip-themes` to execute FIN-CLI without loading plugins or themes. If FIN-CLI runs as expected with plugins and themes skipped, then the problem is caused by one of those plugins or the active theme.

To see if the source of the problem is the active theme, run `fin --skip-themes` to see if FIN-CLI loads as expected.

To see if the source of the problem is an active plugin, run fin `--skip-plugins=<plugin-slug>` for each active plugin to see which plugin blocks the full execution of FIN-CLI. For instance, skipping the Akismet plugin would be:

    fin --skip-plugins=akismet

Or, use `xargs` to try the entire list of active plugins:

    fin plugin list --field=name --status=active --skip-plugins | xargs -n1 -I % fin --skip-plugins=% plugin get % --field=name
