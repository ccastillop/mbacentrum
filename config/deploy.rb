application = "mbacentrum"
repository = 'git://github.com/ccastillop/mbacentrum.git'
hosts = 'mbacentrum.com'
server = :unicorn
# OPTIONALS

before_restarting_server do
  rake "important:task"
  run "important_command"
end

path = '/home/ccastillo/apps'                                # default /var/local/apps
user = 'ccastillo'                              # default deploy
ssh_opts = '-A'                              # default empty
branch = 'master'                        # default master
#sudo = false                                  # default false
cache_dirs = ['public/cache', 'tmp/cache']   # default ['public/cache']
#skip_steps = ['install_gems', 'clear_cache'] # default []
#app_folder = 'project_folder'                # default empty
