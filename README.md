# Atlas

##### A sandboxing Elixir/Phoenix app built around a growing database of my favorite places in Colorado

![Elixir CI](https://github.com/noelworden/atlas/workflows/Elixir%20CI/badge.svg)

https://www.theanglingatlas.com

----
## Spinning up project with Docker
  - Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
  - In one terminal tab:
    - `docker-compose build`
    - `docker-compose up`
  - In a second tab, once the two commands in the first tab are completed:  
    - `docker-compose exec web mix ecto.setup`
  - If everything spins up with no errors, site will be live at [localhost:4000](http://localhost:4000)
----
## Run seeds
  - The `seeds.exs` file is executed in the `ecto.setup` `mix` command, in the steps above
  - If the seeds need to be run again, it can be done with the following command:
    - `docker-compose exec web mix run priv/repo/seeds.exs`

----
## `run` vs `exec`

When executing a command with `docker-compose` it can be run with either `run` or `exec`. 

From the docs:
- The docker `run` command first creates a writeable container layer over the specified image, and then `starts` it using the specified command
  - If using `run`, adding the `--rm` flag will automatically remove the container when the command is finished
- The docker `exec` command runs a new command in a running container

References:
https://docs.docker.com/engine/reference/commandline/run/
https://docs.docker.com/engine/reference/commandline/exec/

----
## Debugging
With the project running on Docker, the standard `iex -S mix` will not work to spin up an iEX console. An updated command, that works with Docker is:

`docker-compose exec web iex -S mix`

This command will maintain history from one iEX shell to another:

`docker-compose exec web iex --erl "-kernel shell_history enabled" -S mix`

----
## Testing
With the project running on Docker tests can be run with:

`docker-compose exec web mix test`

To run only a specific test file:

`docker-compose exec web mix test test/<path to file>`

To run only a specific test within a test file:

`docker-compose exec web mix test test/<path to file>:<test line number>`

----
## Deploying to staging
### Hosted by Gigalixir, docs can be found [here](https://gigalixir.readthedocs.io/en/latest/)
  - It should be noted that the docs are _very_ good, and searchable
  - Once the CLI is installed, `gigalixir help` is also very detailed

### Project URL
  - https://atlas.gigalixirapp.com/

### Install Gigalixir CLI (with homebrew)
  - `brew tap gigalixir/brew && brew install gigalixir`

### Log into Gigalixir
  - `gigalixir login`

### Verify login was successful
  - `gigalixir account`

### Setup git remote
  - Navigate to project folder
  - `gigalixir git:remote atlas`

### Confirm remote
  - `git remote -v`

### If desired, rename remote (which defaulted to `gigalixir`) to `staging`
  - `git remote rename gigalixir staging`

### Push to staging
  - Any branch can be pushed to the staging site
  - Branches need to be pushed to Github before being pushed to staging
    - `git push staging <branch name>:master`

### Main vs Master
  - This project's main branch is named `main`, but Gigalixir is expecting it to be named `master`
    - Because of this, when pushing `main` to staging, it _cannot_ be done with the shorthand:
      `git push staging master`
    - Until a fix is made by Gigalixir, the following syntax must be used to push:
      `git push staging main:master`

----
## Executing `mix` Commands in Staging
#### The app is currently setup to be able to run mix commands on the staging environment

### The `run` command
  - This can be used to run a shell command as a job in a separate container
  - `gigalixir run ...`

### Using `run` and `mix`
  - Any `mix` command available locally can be executing on staging utilizing `run`
  - `gigalixir run mix <command here>`

### Executing a migration
  - `gigalixir run mix ecto.migrate`
  - The logs do not automatically show, to view the logs
    - `gigalixir logs`

----
## Viewing the app
### To open the app in a browser
- `gigalixir open`
