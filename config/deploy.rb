lock '3.2.1'

set :application, 'transchat'

set :scm, :git
set :repo_url, 'git@github.com:kami30k/transchat.git'
set :branch, 'master'

set :deploy_to, '/var/www/transchat'

set :linked_files, %w{.env}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5
