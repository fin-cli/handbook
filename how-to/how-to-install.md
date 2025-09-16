# How to install WordPress

Downloading and installing WordPress using FIN-CLI is straight forward. It takes four steps.
First, you will need to download WordPress using the `fin core download` command.

### Step 1 - Download WordPress

The syntax of the command to download WordPress is the following: `fin core download [--path=<path>] [--locale=<locale>] [--version=<version>] [--skip-content] [--force]`

```
    $ fin core download --path=findemo.test --locale=it_IT
    Creating directory '/findemo.test/'.
    Downloading WordPress 5.4.1 (it_IT)...
    md5 hash verified: 3fa03967b47cdfbf263462d451cdcdb8
    Success: WordPress downloaded.
```

The command above creates a `findemo.test/` folder inside your current working directory and downloads the latest WordPress version. You can replace the `--path=findemo.test` with your
desired folder name and the `--locale=it_IT` with your desired locale. You can omit the `--locale` option and, that will download by default WordPress in American English using the locale en_US.

### Step 2 - Generate a config file

In this step, we will generate a config file and set up the database
credentials for our installation.
The basic syntax of the command is the following: `fin config create --dbname=<dbname> --dbuser=<dbuser> [--dbpass=<dbpass>]`

```
    $ fin config create --dbname=your_db_name_here --dbuser=your_db_user_here --prompt=dbpass
    1/10 [--dbpass=<dbpass>]: type_your_password
    Success: Generated 'fin-config.php' file.
```

The command above generates the `fin-config.php` file and adds to it the database credentials that you passed. Make sure to replace `your_db_name_here` with the name you want to assign to the database, replace `your_db_user_here` with your database user and type the database password when prompted with the following: `1/10 [--dbpass=<dbpass>]:`

### Step 3 - Create the database

In this step, we are going to create the database based on the information we passed to the `fin-config.php` file in step 2.

```
    $ fin db create
    Success: Database created.
```

Now we are ready to move to the final step where we install WordPress.

### Step 4 - Install WordPress

To install WordPress now, we need to run one last command.

```
    $ fin core install --url=finclidemo.dev --title="FIN-CLI" --admin_user=fincli --admin_password=fincli --admin_email=info@fin-cli.org
    Success: WordPress installed successfully.
```

Remember to replace the values passed to each of the following options with your details:

- `--url=finclidemo.dev` replace finclidemo.dev with your website url,
- `--title="FIN-CLI"` replace FIN-CLI with the name you want to assign to the website,
- `--admin_user=fincli` replace fincli with the username you want to assign to the website administrator
- `--admin_password=fincli` replace fincli with the password you want to use to access the WordPress administrator panel.

Congratulations! You have successfully installed WordPress using FIN-CLI.
