# fin embed cache

Finds, triggers, and deletes oEmbed caches.

### EXAMPLES

    # Find cache post ID for a given URL.
    $ fin embed cache find https://www.youtube.com/watch?v=dQw4w9WgXcQ --width=500
    123

    # Clear cache for a post.
    $ fin embed cache clear 123
    Success: Cleared oEmbed cache.

    # Triggers cache for a post.
    $ fin embed cache trigger 456
    Success: Caching triggered!


