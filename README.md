# shadow

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What shadow affects](#what-shadow-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with shadow](#beginning-with-shadow)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

**/etc/default/useradd** and **login.defs** management

## Setup

### What shadow affects

* manages package containing **/etc/default/useradd**
* **/etc/default/useradd** itself

### Setup Requirements

This module requires pluginsync enabled

### Beginning with shadow

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

### classes

#### shadow::logindefs

* **maildir**:        = $shadow::params::maildir_default,
* **pass_max_days**:  = $shadow::params::pass_max_days_default,
* **pass_min_days**:  = $shadow::params::pass_min_days_default,
* **pass_min_len**:   = $shadow::params::pass_min_len_default,
* **pass_warn_age**:  = $shadow::params::pass_warn_age_default,
* **uid_min**:			  = '1000',
* **uid_max**:			  = '60000',
* **gid_min**:			  = '1000',
* **gid_max**:			  = '60000',
* **sys_uid_min**:    = $shadow::params::sys_uid_min_default,
* **sys_uid_max**:    = $shadow::params::sys_uid_max_default,
* **sys_gid_min**:    = $shadow::params::sys_gid_min_default,
* **sys_gid_max**:    = $shadow::params::sys_gid_max_default,
* **encrypt_method**: = $encrypt_method_default,

#### shadow::useradd

* **group**: The group name or ID for a new user's initial group (when the **-N/--no-user-group** is used or when the **USERGROUPS_ENAB** variable is set to **no** in **/etc/login.defs**). The named group must exist, and a numerical group **ID** must have an existing entry (default: 100)
* **home**: The default base directory for the system if no homedir (-d) is specified. **home** is concatenated with the account name to define the home directory. (default: /home)
* **inactive**:  The number of days after a password expires until the account is permanently disabled. A value of 0 disables the account as soon as the password has expired, and a value of -1 disables the feature (default: -1)
* **expire**: The date on which the user account will be disabled. The date is specified in the format YYYY-MM-DD (default: undef)
* **shell**: The name of the user's login shell (default: /sbin/nologin)
* **skel**:  The skeleton directory, which contains files and directories to be copied in the user's home directory, when the home directory is created by useradd. (default: /etc/skel)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

TODO list

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
