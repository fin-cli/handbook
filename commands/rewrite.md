# fin rewrite

Lists or flushes the site's rewrite rules, updates the permalink structure.

See the WordPress [Rewrite API](https://codex.wordpress.org/Rewrite_API) and
[FIN Rewrite](https://codex.wordpress.org/Class_Reference/FIN_Rewrite) class reference.

### EXAMPLES

    # Flush rewrite rules
    $ fin rewrite flush
    Success: Rewrite rules flushed.

    # Update permalink structure
    $ fin rewrite structure '/%year%/%monthnum%/%postname%'
    Success: Rewrite structure set.

    # List rewrite rules
    $ fin rewrite list --format=csv
    match,query,source
    ^fin-json/?$,index.php?rest_route=/,other
    ^fin-json/(.*)?,index.php?rest_route=/$matches[1],other
    category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$,index.php?category_name=$matches[1]&amp;feed=$matches[2],category
    category/(.+?)/(feed|rdf|rss|rss2|atom)/?$,index.php?category_name=$matches[1]&amp;feed=$matches[2],category
    category/(.+?)/embed/?$,index.php?category_name=$matches[1]&amp;embed=true,category


