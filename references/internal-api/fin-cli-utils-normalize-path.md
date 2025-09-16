# FIN_CLI\Utils\normalize_path()

Normalize a filesystem path.

***

## Usage

    FIN_CLI\Utils\normalize_path( $path )

<div>
<strong>$path</strong> (string) Path to normalize.<br />
<strong>@return</strong> (string) path.<br />
</div>


***

## Notes

On Windows systems, replaces backslashes with forward slashes
and forces upper-case drive letters.
Allows for two leading slashes for Windows network shares, but
ensures that all other duplicate slashes are reduced to a single one.
Ensures upper-case drive letters on Windows systems.


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-home-dir/">FIN_CLI\Utils\get_home_dir()</a></strong> - Get the home directory.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-trailingslashit/">FIN_CLI\Utils\trailingslashit()</a></strong> - Appends a trailing slash.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-temp-dir/">FIN_CLI\Utils\get_temp_dir()</a></strong> - Get the system's temp directory. Warns user if it isn't writable.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-php-binary/">FIN_CLI\Utils\get_php_binary()</a></strong> - Get the path to the PHP binary used when executing FIN-CLI.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-get-php-binary/">FIN_CLI::get_php_binary()</a></strong> - Get the path to the PHP binary used when executing FIN-CLI.</li>



</ul>


