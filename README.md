Gatling Notes
=============

> Deploying two phoenix apps (Hatchery and Nest in this case) onto a single EC2 instance

## Getting EC2 Instance
* AWS Console
* Launch t2.micro
* Install SSH Keys
* SSH onto the box

## Installing Gatling (and company) on the box
On the box, do the following:
* `touch setup.sh`
* copy the contents of `setup.sh` into the remote
* `chmod u+x setup.sh`
* run `./setup.sh`
* add `MIX_ENV=prod` to `/etc/environment`

## Setup the apps
* `mix gatling.load {mix project name}`
*From the Gatling Docs*
> This only creates git repository on your server.
> Remember, when pushing to this repository, it would be `remote_server_username@address.to_server:<project name>`
> e.g. for a Digital Ocean box, you would push to `root@xx.xx.xx.xx:sample_project`

* Add a `domains` file
```
www.example.com
sample_project.example.com
api.example.com
```

* Create your remote in the local git repository
`$ git remote add production user_with_root_access@<address.to.server>:<project_name>`
`$ git push production master`

* Follow the commands for initial deployment after push to production


### Notes
* Ensure the distillery build works locally with `MIX_ENV=prod mix release`
