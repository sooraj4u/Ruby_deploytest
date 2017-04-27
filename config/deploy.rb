set :application, 'deploy_test'
set :repo_url, 'https://github.com/sooraj4u/Ruby_deploytest.git'

set :deploy_to, '/home/spowers/deploy_test/test'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'spowers:restart'
  after :finishing, 'spowers:cleanup'
end

