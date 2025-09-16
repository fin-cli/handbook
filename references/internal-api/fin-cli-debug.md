# FIN_CLI::debug()

Display debug message prefixed with &quot;Debug: &quot; when `--debug` is used.

***

## Usage

    FIN_CLI::debug( $message, $group = false )

<div>
<strong>$message</strong> (string|FIN_Error|Exception|Throwable) Message to write to STDERR.<br />
<strong>$group</strong> (string|bool) Organize debug message to a specific group.<br />
<strong>@return</strong> (void) <br />
</div>


***

## Notes

Debug message is written to STDERR, and includes script execution time.

Helpful for optionally showing greater detail when needed. Used throughout
FIN-CLI bootstrap process for easier debugging and profiling.

```
# Called in `FIN_CLI\Runner::set_fin_root()`.
private static function set_fin_root( $path ) {
    define( 'ABSPATH', Utils\trailingslashit( $path ) );
    FIN_CLI::debug( 'ABSPATH defined: ' . ABSPATH );
    $_SERVER['DOCUMENT_ROOT'] = realpath( $path );
}

# Debug details only appear when `--debug` is used.
# $ fin --debug
# [...]
# Debug: ABSPATH defined: /srv/www/wordpress-develop.dev/src/ (0.225s)
```
Use `false` to not group the message.


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


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-warning/">FIN_CLI::warning()</a></strong> - Display warning message prefixed with &quot;Warning: &quot;.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error/">FIN_CLI::error()</a></strong> - Display error message prefixed with &quot;Error: &quot; and exit script.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-halt/">FIN_CLI::halt()</a></strong> - Halt script execution with a specific return code.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error-multi-line/">FIN_CLI::error_multi_line()</a></strong> - Display a multi-line error message in a red box. Doesn't exit script.</li>



</ul>


