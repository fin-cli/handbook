# FIN_CLI\Utils\esc_like()

First half of escaping for LIKE special characters % and _ before preparing for MySQL.

***

## Usage

    FIN_CLI\Utils\esc_like( $text )

<div>
<strong>$text</strong> (string) The raw text to be escaped. The input typed by the user should have no<br />
<strong>@return</strong> (string) in the form of a LIKE phrase. The output is not SQL safe. Call $findb::prepare()<br />
</div>


***

## Notes

Use this only before findb::prepare() or esc_sql().  Reversing the order is very bad for security.

Copied from core "fin-includes/fin-db.php". Avoids dependency on FIN 4.4 findb.
                    extra or deleted slashes.
               or real_escape next.


*Internal API documentation is generated from the FIN-CLI codebase on every release. To suggest improvements, please submit a pull request.*


***

## Related

<ul>



<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-write-csv/">FIN_CLI\Utils\write_csv()</a></strong> - Write data as CSV to a given file.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-http-request/">FIN_CLI\Utils\http_request()</a></strong> - Make a HTTP request to a remote URL.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-get-named-sem-ver/">FIN_CLI\Utils\get_named_sem_ver()</a></strong> - Compare two version strings to get the named semantic version.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-parse-ssh-url/">FIN_CLI\Utils\parse_ssh_url()</a></strong> - Parse a SSH url for its host, port, and path.</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-basename/">FIN_CLI\Utils\basename()</a></strong> - Locale-independent version of basename()</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-ispiped/">FIN_CLI\Utils\isPiped()</a></strong> - Checks whether the output of the current script is a TTY or a pipe / redirect</li>


<li><strong><a href="https://make.wordpress.org/cli/handbook/internal-api/fin-cli-utils-proc-open-compat/">FIN_CLI\Utils\proc_open_compat()</a></strong> - Windows compatible `proc_open()`. Works around bug in PHP, and also deals with *nix-like `ENV_VAR=blah cmd` environment variable prefixes.</li>



</ul>


