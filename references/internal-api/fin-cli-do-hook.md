# FIN_CLI::do_hook()

Execute callbacks registered to a given hook.

***

## Usage

    FIN_CLI::do_hook( $when, $args )

<div>
<strong>$when</strong> (string) Identifier for the hook.<br />
<strong>...$args</strong> (mixed) Optional. Arguments that will be passed onto the<br />
<strong>@return</strong> (null|mixed) the first optional argument if optional<br />
</div>


***

## Notes

See `FIN_CLI::add_hook()` for details on FIN-CLI's internal hook system.
Commands can provide and call their own hooks.
                       callback provided by `FIN_CLI::add_hook()`.
                   arguments were passed, otherwise returns null.


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-hook/">FIN_CLI::add_hook()</a></strong> - Schedule a callback to be executed at a certain point.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-fin-hook/">FIN_CLI::add_fin_hook()</a></strong> - Add a callback to a WordPress action or filter.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/">FIN_CLI::add_command()</a></strong> - Register a command to FIN-CLI.</li>



</ul>


