# FIN_CLI\Utils\get_flag_value()

Return the flag value or, if it's not set, the $default value.

***

## Usage

    FIN_CLI\Utils\get_flag_value( $assoc_args, $flag, $default = null )

<div>
<strong>$assoc_args</strong> (array&lt;string,string|bool&gt;) Arguments array.<br />
<strong>$flag</strong> (string) Flag to get the value.<br />
<strong>$default</strong> (mixed) Default value for the flag. Default: NULL.<br />
<strong>@return</strong> (mixed) <br />
</div>


***

## Notes

Because flags can be negated (e.g. --no-quiet to negate --quiet), this
function provides a safer alternative to using
`isset( $assoc_args['quiet'] )` or similar.


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-launch-editor-for-input/">FIN_CLI\Utils\launch_editor_for_input()</a></strong> - Launch system's $EDITOR for the user to edit some text.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-report-batch-operation-results/">FIN_CLI\Utils\report_batch_operation_results()</a></strong> - Report the results of the same operation against multiple resources.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-parse-str-to-argv/">FIN_CLI\Utils\parse_str_to_argv()</a></strong> - Parse a string of command line arguments into an $argv-esqe variable.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-confirm/">FIN_CLI::confirm()</a></strong> - Ask for confirmation before running a destructive operation.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-read-value/">FIN_CLI::read_value()</a></strong> - Read a value, from various formats.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-has-config/">FIN_CLI::has_config()</a></strong> - Confirm that a global configuration parameter does exist.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-get-config/">FIN_CLI::get_config()</a></strong> - Get values of global configuration parameters.</li>



</ul>


