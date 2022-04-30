TEAMCITY TERRAFORM MODULE
=========================

A terraform module to deploy a TeamCity server and agent - a CI/CD toolkit.

Note: A module a bit outdated. Will update is someday.


Module Input Variables
----------------------

 - `instance` - A teamcity instance where to create the teamcity.
 - `instance_name` - A teamcity instance name. If an instance isn't provided a new one will be created with this name.
 - `instance_version` - The teamcity instance version (POSTGRES_9_6).
 - `instance_availability_type` - The instance availability type (REGIONAL).
 - `name` - A teamcity name (default).
 - `network` - The network to which teamcity should be attached.
 - `ipv4_enabled` - Enable public IPv4 address support (false).
 - `user` - A teamcity username to create (postgres).
 - `password` - A password for the teamcity user (generate random).


Usage
-----

```hcl
module "teamcity" {
  source = "git::git@github.com:dmitrii-ageev/terraform-teamcity?ref=0.1.0"

  instance_name = "postgresql"
  network = "${data.google_compute_network.my_network.name}"
}
```


Outputs
=======

 - `teamcity` - The teamcity reference.
 - `teamcity_name` - The teamcity name.
 - `teamcity_instance` - A teamcity instance reference.
 - `teamcity_instance_name` - A teamcity instance name.
 - `ip_address` - The reference to a teamcity private IP address.


Authors
=======

Dmitrii Ageev <dmitrii@opsworks.ru>
