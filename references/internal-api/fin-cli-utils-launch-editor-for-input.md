# FIN_CLI\Utils\launch_editor_for_input()

Launch system's $EDITOR for the user to edit some text.

***

## Usage

    FIN_CLI\Utils\launch_editor_for_input( $input, $title = FIN-CLI, $ext = tmp )

<div>
<strong>$input</strong> (string) Some form of text to edit (e.g. post content).<br />
<strong>$title</strong> (string) Title to display in the editor.<br />
<strong>$ext</strong> (string) Extension to use with the temp file.<br />
<strong>@return</strong> (string|bool) text, if file is saved from editor; false, if no change to file.<br />
</div>


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-flag-value/">FIN_CLI\Utils\get_flag_value()</a></strong> - Return the flag value or, if it's not set, the $default value.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-report-batch-operation-results/">FIN_CLI\Utils\report_batch_operation_results()</a></strong> - Report the results of the same operation against multiple resources.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-parse-str-to-argv/">FIN_CLI\Utils\parse_str_to_argv()</a></strong> - Parse a string of command line arguments into an $argv-esqe variable.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-confirm/">FIN_CLI::confirm()</a></strong> - Ask for confirmation before running a destructive operation.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-read-value/">FIN_CLI::read_value()</a></strong> - Read a value, from various formats.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-has-config/">FIN_CLI::has_config()</a></strong> - Confirm that a global configuration parameter does exist.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-get-config/">FIN_CLI::get_config()</a></strong> - Get values of global configuration parameters.</li>



</ul>


