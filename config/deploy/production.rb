set :rails_env, 'production'

server 'transchat_production', roles: %w{web app db}
