require 'bundler'
Bundler.require

a = 'app'
c = 'controllers'
m = 'models'
r = '*.rb'

#####################################
# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

##########################
# require the controller(s)
Dir.glob(File.join(APP_ROOT, a, c, r)).each { |file| require file }

######################
# require the model(s)
Dir.glob(File.join(APP_ROOT, a, m, r)).each { |file| require file }

###################################
# configure TaskManagerApp settings
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
