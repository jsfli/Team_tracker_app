class Team

  @@teams = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @logo = attributes.fetch(:logo)
    @id = @@teams.length().+(1)
    @members = []
  end

  attr_reader(:name, :logo, :id, :members)

  define_singleton_method(:all) do
    @@teams
  end

  define_method(:save) do
    @@teams.push(self)
  end

  define_singleton_method(:clear) do
    @@teams = []
  end

  define_singleton_method(:find) do |id|
    found_team = nil
    @@teams.each() do |team|
      if team.id().eql?(id)
        found_team = team
      end
    end
    found_team
  end

  define_method(:add_member) do |member|
    @members.push(member)
  end
  
end #end of Team class
