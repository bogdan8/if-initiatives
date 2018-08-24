# Initiatives

[![Build Status](https://travis-ci.com/bogdan8/if-initiatives.svg?branch=develop)](https://travis-ci.com/bogdan8/if-initiatives)
[![codecov](https://codecov.io/gh/bogdan8/if-initiatives/branch/develop/graph/badge.svg)](https://codecov.io/gh/bogdan8/if-initiatives)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Setup rails
```sh
$ git clone git@github.com:bogdan8/if-initiatives
$ cd if-initiatives
$ bundle
$ rake db:setup
$ rails s
```

# Setup rails & react
```sh
$ git clone git@github.com:bogdan8/if-initiatives
$ cd if-initiatives
$ bundle
$ rake db:setup
$ cd client && npm i
$ foreman start -f Procfile.dev
```

**Note!** You should have this versions:
> -  Ruby: `2.5.0`
> -  Rails: `~> 5.1.5`
> -  Node: `8.10.0`
> -  Npm: `5.8.0`

# Generating graphs for the Initiative
```sh
$ rake state_machine:draw FILE=initiative.rb CLASS=Initiative
```

# Checking the code
```sh
$ rubocop
$ matric_fu
$ rubycritic
$ rails_best_practices
```

# Initiative states
![img](https://github.com/bogdan8/if-initiatives/blob/develop/Initiative_state.png)
