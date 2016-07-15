# CentOS 6 Setup


## Description

This Puppet module is used to set up a server powered by CentOS 6 for a Rails application. Specifically, it is used to powered a Texting app at [https://github.com/gVien/texter](https://github.com/gVien/texter).

## Setup

1. Create an AWS EC2 CentOS 6 server.
2. Using the `.pem` file, log in as `root` and clone this repo in your root folder.
3. `cd centos6-setup/manifests`
4. `puppet apply init.pp` which will install all the tools needed to run Rails including `git`, `ruby`, `rails`, etc. Note that if the .sh file that contains `Ruby/Rails` does not install properly, you can run it with `./install.sh`. For some reasons, Rails installation is buggy in CentOS 6 and needs several retries (2-4).
5. The module also adds a directory at `/var/www/texter` for the application to live in. The user `deployer` cannot write to this directory, which is required during deployment. To grant access to this path for the `deployer` user, type

`sudo chown deployer /var/www/texter`

6. The user created with the Puppet module has not been set up a password which is required during the deployment of the `Texter` app. You can create it by simply typing

  `sudo passwd deployer` and proceed with creating the new password.

7. The installation of Ruby and Rails are not shareable between users, so after `root` user is set up, please also apply the module to user `deployer` by repeating steps 2-4 above (but log in as `deployer`). This set up for the `deployer` user is required since the app is deployed by the `deployer`.
8. The installation should take about 1-2 hours depending on how fast the installation. Installation of Ruby and Rails can take 30+ minutes each.