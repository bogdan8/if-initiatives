# Initiatives

**Initiatives**

[![Build Status](https://travis-ci.com/bogdan8/if-initiatives.svg?branch=develop)](https://travis-ci.com/bogdan8/if-initiatives)

# Setup rails
```sh
$ git clone git@github.com:bogdan8/if-initiatives
$ cd pivorak-web-app
$ bundle
$ rake db:setup
$ rails s
```

# Setup rails & react
```sh
$ git clone git@github.com:bogdan8/if-initiatives
$ cd pivorak-web-app
$ bundle
$ rake db:setup
$ cd client && npm i
$ foreman start -f Procfile.dev
```

**Note!** You should have this versions:
> -  Ruby: `2.4.3`
> -  Rails: `~> 5.1.5`
> -  Node: `8.10.0`
> -  Npm: `5.8.0`

# Generating graphs for the Initiative:
```sh
$ rake state_machine:draw FILE=initiative.rb CLASS=Initiative
```
