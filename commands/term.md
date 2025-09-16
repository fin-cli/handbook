# fin term

Manages taxonomy terms and term meta, with create, delete, and list commands.

See reference for [taxonomies and their terms](https://codex.wordpress.org/Taxonomies).

### EXAMPLES

    # Create a new term.
    $ fin term create category Apple --description="A type of fruit"
    Success: Created category 199.

    # Get details about a term.
    $ fin term get category 199 --format=json --fields=term_id,name,slug,count
    {"term_id":199,"name":"Apple","slug":"apple","count":1}

    # Update an existing term.
    $ fin term update category 15 --name=Apple
    Success: Term updated.

    # Get the term's URL.
    $ fin term list post_tag --include=123 --field=url
    http://example.com/tag/tips-and-tricks

    # Delete post category
    $ fin term delete category 15
    Success: Deleted category 15.

    # Recount posts assigned to each categories and tags
    $ fin term recount category post_tag
    Success: Updated category term count
    Success: Updated post_tag term count


