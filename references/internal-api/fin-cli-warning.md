# FIN_CLI::warning()

Display warning message prefixed with &quot;Warning: &quot;.

***

## Usage

    FIN_CLI::warning( $message )

<div>
<strong>$message</strong> (string|FIN_Error|Exception|Throwable) Message to write to STDERR.<br />
<strong>@return</strong> (void) <br />
</div>


***

## Notes

Warning message is written to STDERR, or discarded when `--quiet` flag is supplied.

Use instead of `FIN_CLI::debug()` when script execution should be permitted
to continue.

```
# `fin plugin activate` skips activation when plugin is network active.
$status = $this->get_status( $plugin->file );
// Network-active is the highest level of activation status
if ( 'active-network' === $status ) {
  FIN_CLI::warning( "Plugin '{$plugin->name}' is already network active." );
  continue;
}
```


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-format-items/">FIN_CLI\Utils\format_items()</a></strong> - Render a collection of items as an ASCII table, JSON, CSV, YAML, list of ids, or count.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-make-progress-bar/">FIN_CLI\Utils\make_progress_bar()</a></strong> - Create a progress bar to display percent completion of a given operation.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-colorize/">FIN_CLI::colorize()</a></strong> - Colorize a string for output.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-line/">FIN_CLI::line()</a></strong> - Display informational message without prefix, and ignore `--quiet`.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-log/">FIN_CLI::log()</a></strong> - Display informational message without prefix.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-success/">FIN_CLI::success()</a></strong> - Display success message prefixed with &quot;Success: &quot;.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-debug/">FIN_CLI::debug()</a></strong> - Display debug message prefixed with &quot;Debug: &quot; when `--debug` is used.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error/">FIN_CLI::error()</a></strong> - Display error message prefixed with &quot;Error: &quot; and exit script.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-halt/">FIN_CLI::halt()</a></strong> - Halt script execution with a specific return code.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error-multi-line/">FIN_CLI::error_multi_line()</a></strong> - Display a multi-line error message in a red box. Doesn't exit script.</li>



</ul>


