[![Build Status](https://travis-ci.org/Jeoffreybauvin/gitlab-ci-multi-runner.svg?branch=master)](https://travis-ci.org/Jeoffreybauvin/gitlab-ci-multi-runner)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with gitlab_ci_multi_runner](#setup)
    * [What gitlab_ci_multi_runner affects](#what-gitlab_ci_multi_runner-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with gitlab_ci_multi_runner](#beginning-with-gitlab_ci_multi_runner)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

A one-maybe-two sentence summary of what the module does/what problem it solves. This is your 30 second elevator pitch for your module. Consider including OS/Puppet version it works with.       

##Module Description

If applicable, this section should have a brief description of the technology the module integrates with and what that integration enables. This section should answer the questions: "What does this module *do*?" and "Why would I use it?"

If your module has a range of functionality (installation, configuration, management, etc.) this is the time to mention it.

##Setup

###What gitlab_ci_multi_runner affects

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form. 

###Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, etc.), mention it here. 

###Beginning with gitlab_ci_multi_runner

To use the gitlab_ci_multi_runner with default parameters, declare the ```gitlab_ci_multi_runner``` class.

```puppet
include gitlab_ci_multi_runner
```

**Note:** The main gitlab_ci_multi_runner class is required by all other classes, types, and defines in this module. You must declare it whenever you use the module.

##Usage

### Hiera

```hiera
gitlab_ci_multi_runner::runners:
  'host01-ssh':
    url: 'https://gitlab.example.com/ci'
    token: 'abb0d7b09e8491ccc6a0d4264fc319ca'
    tls_skip_verify: true
    tls_ca_file: '/usr/local/share/ca-certificates/ca.crt'
    executor: 'ssh'
    ssh_params:
      host: "%{::fqdn}"
      port: '22'
      user: 'gitlab-runner'
      password: 'strongpassword'
      identity_file: ''
```

##Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

##Limitations

This is where you list OS compatibility, version compatibility, etc.

##Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

##Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header. 
