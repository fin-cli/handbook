# FIN_CLI::add_hook()

Schedule a callback to be executed at a certain point.

***

## Usage

    FIN_CLI::add_hook( $when, $callback )

<div>
<strong>$when</strong> (string) Identifier for the hook.<br />
<strong>$callback</strong> (mixed) Callback to execute when hook is called.<br />
<strong>@return</strong> (void) <br />
</div>


***

## Notes

Hooks conceptually are very similar to WordPress actions. FIN-CLI hooks
are typically called before WordPress is loaded.

FIN-CLI hooks include:

* `before_add_command:<command>` - Before the command is added.
* `after_add_command:<command>` - After the command was added.
* `before_invoke:<command>` (1) - Just before a command is invoked.
* `after_invoke:<command>` (1) - Just after a command is invoked.
* `find_command_to_run_pre` - Just before FIN-CLI finds the command to run.
* `before_registering_contexts` (1) - Before the contexts are registered.
* `before_fin_load` - Just before the FIN load process begins.
* `before_fin_config_load` - After fin-config.php has been located.
* `after_fin_config_load` - After fin-config.php has been loaded into scope.
* `after_fin_load` - Just after the FIN load process has completed.
* `before_run_command` (3) - Just before the command is executed.

The parentheses behind the hook name denote the number of arguments
being passed into the hook. For such hooks, the callback should return
the first argument again, making them work like a FIN filter.

FIN-CLI commands can create their own hooks with `FIN_CLI::do_hook()`.

If additional arguments are passed through the `FIN_CLI::do_hook()` call,
these will be passed on to the callback provided by `FIN_CLI::add_hook()`.

```
# `fin network meta` confirms command is executing in multisite context.
FIN_CLI::add_command( 'network meta', 'Network_Meta_Command', array(
   'before_invoke' => function ( $name ) {
       if ( !is_multisite() ) {
           FIN_CLI::error( 'This is not a multisite installation.' );
       }
   }
) );
```


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-do-hook/">FIN_CLI::do_hook()</a></strong> - Execute callbacks registered to a given hook.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-fin-hook/">FIN_CLI::add_fin_hook()</a></strong> - Add a callback to a WordPress action or filter.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-add-command/">FIN_CLI::add_command()</a></strong> - Register a command to FIN-CLI.</li>



</ul>


