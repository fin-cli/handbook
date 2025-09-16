# FIN_CLI::colorize()

Colorize a string for output.

***

## Usage

    FIN_CLI::colorize( $string )

<div>
<strong>$string</strong> (string) String to colorize for output, with color tokens.<br />
<strong>@return</strong> (string) string.<br />
</div>


***

## Notes

Yes, you can change the color of command line text too. For instance,
here's how `FIN_CLI::success()` colorizes "Success: "

```
FIN_CLI::colorize( "%GSuccess:%n " )
```

Uses `\cli\Colors::colorize()` to transform color tokens to display
settings. Choose from the following tokens (and note 'reset'):

* %y => ['color' => 'yellow'],
* %g => ['color' => 'green'],
* %b => ['color' => 'blue'],
* %r => ['color' => 'red'],
* %p => ['color' => 'magenta'],
* %m => ['color' => 'magenta'],
* %c => ['color' => 'cyan'],
* %w => ['color' => 'grey'],
* %k => ['color' => 'black'],
* %n => ['color' => 'reset'],
* %Y => ['color' => 'yellow', 'style' => 'bright'],
* %G => ['color' => 'green', 'style' => 'bright'],
* %B => ['color' => 'blue', 'style' => 'bright'],
* %R => ['color' => 'red', 'style' => 'bright'],
* %P => ['color' => 'magenta', 'style' => 'bright'],
* %M => ['color' => 'magenta', 'style' => 'bright'],
* %C => ['color' => 'cyan', 'style' => 'bright'],
* %W => ['color' => 'grey', 'style' => 'bright'],
* %K => ['color' => 'black', 'style' => 'bright'],
* %N => ['color' => 'reset', 'style' => 'bright'],
* %3 => ['background' => 'yellow'],
* %2 => ['background' => 'green'],
* %4 => ['background' => 'blue'],
* %1 => ['background' => 'red'],
* %5 => ['background' => 'magenta'],
* %6 => ['background' => 'cyan'],
* %7 => ['background' => 'grey'],
* %0 => ['background' => 'black'],
* %F => ['style' => 'blink'],
* %U => ['style' => 'underline'],
* %8 => ['style' => 'inverse'],
* %9 => ['style' => 'bright'],
* %_ => ['style' => 'bright']


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-format-items/">FIN_CLI\Utils\format_items()</a></strong> - Render a collection of items as an ASCII table, JSON, CSV, YAML, list of ids, or count.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-make-progress-bar/">FIN_CLI\Utils\make_progress_bar()</a></strong> - Create a progress bar to display percent completion of a given operation.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-line/">FIN_CLI::line()</a></strong> - Display informational message without prefix, and ignore `--quiet`.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-log/">FIN_CLI::log()</a></strong> - Display informational message without prefix.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-success/">FIN_CLI::success()</a></strong> - Display success message prefixed with &quot;Success: &quot;.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-debug/">FIN_CLI::debug()</a></strong> - Display debug message prefixed with &quot;Debug: &quot; when `--debug` is used.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-warning/">FIN_CLI::warning()</a></strong> - Display warning message prefixed with &quot;Warning: &quot;.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error/">FIN_CLI::error()</a></strong> - Display error message prefixed with &quot;Error: &quot; and exit script.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-halt/">FIN_CLI::halt()</a></strong> - Halt script execution with a specific return code.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-error-multi-line/">FIN_CLI::error_multi_line()</a></strong> - Display a multi-line error message in a red box. Doesn't exit script.</li>



</ul>


