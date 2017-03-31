require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/member')
require('./lib/team')

get('/') do
  @teams = Team.all()
  erb(:index)
end

get('/teams/new') do
  erb(:teams_form)
end

post('/teams') do
  @teams = Team.all()
  name = params.fetch("name")
  logo = params.fetch("logo")
  hash = {:name=>name, :logo=>logo}
  team = Team.new(hash)
  team.save()
  erb(:index)
end
