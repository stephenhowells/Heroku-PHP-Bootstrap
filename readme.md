# Heroku PHP Bootstrap

[![Build Status](https://travis-ci.org/stephenhowells/Heroku-PHP-Bootstrap.svg?branch=master)](https://travis-ci.org/stephenhowells/Heroku-PHP-Bootstrap)

This repository is a set of files and commands to quickly get a PHP app up and running on Heroku. Simply customize the included files to fit your particular needs.

### Prerequisites

- Download and install the [Heroku Toolbelt](https://toolbelt.heroku.com/)
- Download and install [Composer](https://getcomposer.org/download/)

### Getting Up and Running on Heroku

The following steps will walk you through downloading this repo and executing the bootstrap script to automate the creation of a new PHP app on Heroku.

**1. If you've never ran the Heroku CLI you'll need to authenticate, otherwise skip this step:**

```bash
$ heroku login
```

**2. Launch a new PHP app on Heroku:**

```bash
# download the repo
$ curl -LO https://github.com/stephenhowells/Heroku-PHP-Bootstrap/archive/master.zip

# unzip and cd into the project folder
$ unzip master.zip
$ cd Heroku-PHP-Bootstrap-master/project 

# make the bootstrap executable and run it, name your new app uniquely
$ chmod +x bootstrap.sh
$ bash bootstrap.sh name-of-app
```

You can view the results once the bootstrap script has finished by running `heroku open`. You'll see the placeholder landing page that you've just uploaded in your browser.

If you need a MySQL database, provision the ClearDB add-on by running `heroku addons:add cleardb`. Their starter "Ignite" database is free of charge.

### Included Files

The `Procfile`, `.user.ini`, `nginx.conf`, and `composer.json` should all reside in the root of the project.

**Procfile**: Tells Heroku you'd like to use the Nginx server and that it should include the customizations detailed in `nginx.conf`.

**nginx.conf**: Place all custom Nginx server configurations in this file. Customizations include what you'd normally see in a site's server block. The included example is intended for use with Laravel but may work with other PHP apps and frameworks.

**.user.ini**: Specify any custom INI settings with modes of PHP_INI_PERDIR and PHP_INI_USER. A list of all the INI settings and their modes can be found [here](http://php.net/manual/en/ini.list.php). In instances where you need even more customization to the PHP environment you can create a [custom FPM configuration](https://devcenter.heroku.com/articles/custom-php-settings#php-fpm-configuration-include).

**composer.json**: Needs no introduction. In this repo's example it shows how to specify the PHP runtime and additional optional extensions. Heroku details how to [tailor the PHP environment](https://devcenter.heroku.com/articles/php-support).

### Tips

- Once your app is stable on the Heroku platform and you are making fewer code deployments, consider enabling preboot to achieve nearly zero downtime deployments. [Learn more about preboot](https://devcenter.heroku.com/articles/preboot).
- If you're using the ClearDB MySQL add-on you'll have to stay with PHP 5.5 for now or else you'll get errors when configuring the SSL connection in PDO or mysqli. The certs ClearDB provide have a name mismatch with their actual endpoint.
- If you've declared a specific runtime and/or extensions in your `composer.json` file that differ from your local development environment, Composer will throw an error during installing and updating. Often your Vagrant PHP runtime won't match what you'll use on Heroku. To avoid experiencing errors when using Composer locally add the `--ignore-platform-reqs` flag to your Composer commands. This tells Composer to simply ignore those PHP runtime dependencies.
- Set logging in your app to STDOUT or STDERR. That way they'll be captured with Heroku's usual logging capabilities. [Papertrail](https://papertrailapp.com) is a great add-on that makes logging even better. Always avoid writing logs to the file system as they'll be very temporary.
- Don't forget to add your environment variables in Heroku. That's an excellent place to store an API's secret key. Keep those out of your app and source control.
- GitHub enforces rate limits for anonymous requests. If this occurs your Heroku deployments will become slower due to Composer being forced to use source-based installs. Heroku details a [workaround](https://devcenter.heroku.com/articles/php-support#custom-github-oauth-tokens) to avoid this issue.
- If your app requires a custom compilation step that should not be included in Composer's `post-install-cmd`, Heroku [explains](https://devcenter.heroku.com/articles/php-support#custom-compile-step) how to execute those tasks.

### License

Licensed under the [MIT license](http://opensource.org/licenses/MIT)