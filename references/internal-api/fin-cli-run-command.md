# FIN_CLI::run_command()

Run a given command within the current process using the same global parameters.

***

## Usage

    FIN_CLI::run_command( $args, $assoc_args = [] )

<div>
<strong>$args</strong> (array) Positional arguments including command name.<br />
<strong>$assoc_args</strong> (array) <br />
</div>


***

## Notes

Use `FIN_CLI::runcommand()` instead, which is easier to use and works better.

To run a command using a new process with the same global parameters,
use FIN_CLI::launch_self(). To run a command using a new process with
different global parameters, use FIN_CLI::launch().

```
ob_start();
FIN_CLI::run_command( array( 'cli', 'cmd-dump' ) );
$ret = ob_get_clean();
```


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-launch/">FIN_CLI::launch()</a></strong> - Launch an arbitrary external process that takes over I/O.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-launch-self/">FIN_CLI::launch_self()</a></strong> - Run a FIN-CLI command in a new process reusing the current runtime arguments.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-runcommand/">FIN_CLI::runcommand()</a></strong> - Run a FIN-CLI command.</li>



</ul>


