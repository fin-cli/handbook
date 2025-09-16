# FIN_CLI::confirm()

Ask for confirmation before running a destructive operation.

***

## Usage

    FIN_CLI::confirm( $question, $assoc_args = [] )

<div>
<strong>$question</strong> (string) Question to display before the prompt.<br />
<strong>$assoc_args</strong> (array) Skips prompt if 'yes' is provided.<br />
</div>


***

## Notes

If 'y' is provided to the question, the script execution continues. If
'n' or any other response is provided to the question, script exits.

```
# `fin db drop` asks for confirmation before dropping the database.

FIN_CLI::confirm( "Are you sure you want to drop the database?", $assoc_args );
```


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-launch-editor-for-input/">FIN_CLI\Utils\launch_editor_for_input()</a></strong> - Launch system's $EDITOR for the user to edit some text.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-flag-value/">FIN_CLI\Utils\get_flag_value()</a></strong> - Return the flag value or, if it's not set, the $default value.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-report-batch-operation-results/">FIN_CLI\Utils\report_batch_operation_results()</a></strong> - Report the results of the same operation against multiple resources.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-parse-str-to-argv/">FIN_CLI\Utils\parse_str_to_argv()</a></strong> - Parse a string of command line arguments into an $argv-esqe variable.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-read-value/">FIN_CLI::read_value()</a></strong> - Read a value, from various formats.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-has-config/">FIN_CLI::has_config()</a></strong> - Confirm that a global configuration parameter does exist.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-get-config/">FIN_CLI::get_config()</a></strong> - Get values of global configuration parameters.</li>



</ul>


