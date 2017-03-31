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

get('/teams/:id') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:team)
end

get('/teams/:id/members/new') do
  @team = Team.find(params.fetch('id').to_i())
  erb(:teams_members_form)
end

post('/member') do
  name = params.fetch("name")
  mobile = params.fetch("mobile")
  email = params.fetch("email")
  photo = params.fetch("photo")
  hash = {:name=>name, :mobile=>mobile, :email=>email, :photo=>photo}
  @member = Member.new(hash)
  @member.save()
  @team = Team.find(params.fetch("team_id").to_i())
  @team.add_member(@member)
  erb(:team)
end
