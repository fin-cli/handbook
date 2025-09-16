# FIN_CLI::error()

Display error message prefixed with &quot;Error: &quot; and exit script.

***

## Usage

    FIN_CLI::error( $message, $exit = true )

<div>
<strong>$message</strong> (string|FIN_Error|Exception|Throwable) Message to write to STDERR.<br />
<strong>$exit</strong> (boolean|integer) True defaults to exit(1).<br />
<strong>@return</strong> (null) <br />
</div>


***

## Notes

Error message is written to STDERR. Defaults to halting script execution
with return code 1.

Use `FIN_CLI::warning()` instead when script execution should be permitted
to continue.

```
# `fin cache flush` considers flush failure to be a fatal error.
if ( false === fin_cache_flush() ) {
    FIN_CLI::error( 'The object cache could not be flushed.' );
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


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-warning/">FIN_CLI::warning()</a></strong> - Display warning message prefixed with &quot;Warning: &quot;.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-halt/">FIN_CLI::halt()</a></strong> - Halt script execution with a specific return code.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error-multi-line/">FIN_CLI::error_multi_line()</a></strong> - Display a multi-line error message in a red box. Doesn't exit script.</li>



</ul>


