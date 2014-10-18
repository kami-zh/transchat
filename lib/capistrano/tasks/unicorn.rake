namespace :unicorn do
  def start_unicorn
    within current_path do
      execute :bundle, :exec, :unicorn_rails, "-c #{current_path}/config/unicorn.rb -E #{fetch(:rails_env)} -D"
    end
  end

  def stop_unicorn
    execute :kill, "-s QUIT `cat #{shared_path}/tmp/pids/unicorn.pid`"
  end

  def reload_unicorn
    execute :kill, "-s USR2 `cat #{shared_path}/tmp/pids/unicorn.pid`"
  end

  desc 'Start unicorn'
  task :start do
    on roles(:web) do
      start_unicorn
    end
  end

  desc 'Stop unicorn'
  task :stop do
    on roles(:web) do
      if test("[ -e #{shared_path}/tmp/pids/unicorn.pid ]")
        stop_unicorn
      end
    end
  end

  desc 'Restart unicorn'
  task :restart do
    on roles(:web) do
      if test("[ -e #{shared_path}/tmp/pids/unicorn.pid ]")
        reload_unicorn
      else
        start_unicorn
      end
    end
  end
end
