# FIN_CLI::add_fin_hook()

Add a callback to a WordPress action or filter.

***

## Usage

    FIN_CLI::add_fin_hook( $tag, $function_to_add, $priority = 10, $accepted_args = 1 )

<div>
<strong>$tag</strong> (string) Named WordPress action or filter.<br />
<strong>$function_to_add</strong> (mixed) Callable to execute when the action or filter is evaluated.<br />
<strong>$priority</strong> (integer) Priority to add the callback as.<br />
<strong>$accepted_args</strong> (integer) Number of arguments to pass to callback.<br />
<strong>@return</strong> (true) <br />
</div>


***

## Notes

`add_action()` without needing access to `add_action()`. If WordPress is
already loaded though, you should use `add_action()` (and `add_filter()`)
instead.


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-hook/">FIN_CLI::add_hook()</a></strong> - Schedule a callback to be executed at a certain point.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-do-hook/">FIN_CLI::do_hook()</a></strong> - Execute callbacks registered to a given hook.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/">FIN_CLI::add_command()</a></strong> - Register a command to FIN-CLI.</li>



</ul>


