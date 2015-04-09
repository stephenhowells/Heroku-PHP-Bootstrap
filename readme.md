# Heroku PHP Bootstrap

[![Build Status](https://travis-ci.org/stephenhowells/Heroku-PHP-Bootstrap.svg)](https://travis-ci.org/stephenhowells/Heroku-PHP-Bootstrap)

This repository is a set of files and commands to quickly get a PHP app up and running on Heroku. Simply customize the included files to fit your particular needs.

### Prerequisites

- Download and install the [Heroku Toolbelt](https://toolbelt.heroku.com/)
- Download and install [Composer](https://getcomposer.org/download/)

### Getting up and running on Heroku

The `Procfile`, `.user.ini`, `nginx.conf`, and `composer.json` should all reside in the root of the project.

**Procfile**: Tells Heroku you'd like to use the Nginx server and that it should include the customizations detailed in `nginx.conf`.

**nginx.conf**: Place all custom Nginx server configurations in this file. Customizations include what you'd normally see in a site's server block. The included example is intended for use with Laravel but may work with other PHP apps and frameworks.

**.user.ini**: Specify any custom INI settings with modes of PHP_INI_PERDIR and PHP_INI_USER. A list of all the INI settings and their modes can be found [here](http://php.net/manual/en/ini.list.php). In instances where you need even more customization to the PHP environment you can create a custom FPM configuration. Heroku explains this scenario [here](https://devcenter.heroku.com/articles/custom-php-settings#php-fpm-configuration-include).

**composer.json**: Needs no introduction. In this repo's example it shows how to specify the PHP runtime and additional optional extensions. Heroku details how to tailor the PHP environment [here](https://devcenter.heroku.com/articles/php-support).

**Finally, navigate to the project folder in your terminal and run:**

```bash
chmod +x bootstrap.sh
bash bootstrap.sh name-of-app
```

### Tips

Once your app is stable on the Heroku platform and you are making fewer code deployments, consider enabling preboot to achieve nearly zero downtime deployments. [Learn more about preboot](https://devcenter.heroku.com/articles/preboot).

### License

Licensed under the [MIT license](http://opensource.org/licenses/MIT)