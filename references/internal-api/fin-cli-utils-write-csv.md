# FIN_CLI\Utils\write_csv()

Write data as CSV to a given file.

***

## Usage

    FIN_CLI\Utils\write_csv( $fd, $rows, $headers = [] )

<div>
<strong>$fd</strong> (resource) File descriptor.<br />
<strong>$rows</strong> (array&lt;string&gt;) Array of rows to output.<br />
<strong>$headers</strong> (array&lt;string&gt;) List of CSV columns (optional).<br />
</div>


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-http-request/">FIN_CLI\Utils\http_request()</a></strong> - Make a HTTP request to a remote URL.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-named-sem-ver/">FIN_CLI\Utils\get_named_sem_ver()</a></strong> - Compare two version strings to get the named semantic version.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-parse-ssh-url/">FIN_CLI\Utils\parse_ssh_url()</a></strong> - Parse a SSH url for its host, port, and path.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-basename/">FIN_CLI\Utils\basename()</a></strong> - Locale-independent version of basename()</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-ispiped/">FIN_CLI\Utils\isPiped()</a></strong> - Checks whether the output of the current script is a TTY or a pipe / redirect</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-proc-open-compat/">FIN_CLI\Utils\proc_open_compat()</a></strong> - Windows compatible `proc_open()`. Works around bug in PHP, and also deals with *nix-like `ENV_VAR=blah cmd` environment variable prefixes.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-esc-like/">FIN_CLI\Utils\esc_like()</a></strong> - First half of escaping for LIKE special characters % and _ before preparing for MySQL.</li>



</ul>


