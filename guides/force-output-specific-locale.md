# Force output to a specific locale

FIN-CLI always outputs English because it doesn't support localization. But, because WordPress supports localization, you may see non-English output when performing specific commands.

For instance:

    $ fin theme update --all
    מעבר למצב תחזוקה...
    מוריד עדכונים מ-https://downloads.wordpress.org/theme/hueman.3.3.25.zip...
    Using cached file '/home/xxx/.fin-cli/cache/theme/hueman-3.3.25.zip'...
    פתיחת עדכון...
    התקנת גרסה חדשה...
    הסרת הגרסה הקודמת של התבנית...
    התבנית עודכנה בהצלחה.
    ביטול מצב תחזוקה...
    +--------+-------------+-------------+---------+
    | name   | old_version | new_version | status  |
    +--------+-------------+-------------+---------+
    | hueman | 3.3.24      | 3.3.25      | Updated |
    +--------+-------------+-------------+---------+
    Success: Updated 1 of 1 themes.

To force WordPress to always output English at the command line, you need to filter the active locale.

Given a `force-locale.php` file:

    <?php
    FIN_CLI::add_fin_hook( 'pre_option_FINLANG', function() {
	    return 'en_US';
    });

You can force the locale to `en_US` with:

    fin --require=force-locale.php

One nice thing about this approach is that you can easily apply it across multiple FIN installs [using a config file](https://make.wordpress.org/cli/handbook/config/#config-files).
