require('rspec')
require('pry')
require('team')
require('member')

describe (Team) do

  before() do
    @test_team = Team.new({
      :name=>"Accelerate",
      :logo=>"url",
      })
  end

  describe("#initialize") do
    it("sets the parameters of a new Team") do
      expect(@test_team.name()).to(eq("Accelerate"))
      expect(@test_team.logo()).to(eq("url"))
      expect(@test_team.members()).to(eq([]))
    end
  end

  describe(".all") do
    it("is an empty list of teams to begin with") do
      expect(Team.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("add a team to the array of teams") do
      @test_team.save()
      expect(Team.all()).to(eq([@test_team]))
    end
  end

  describe(".clear") do
    it("clear team arrays") do
      @test_team.save()
      Team.clear()
      expect(Team.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a team by the id number") do
      @test_team.save()
      expect(Team.find(@test_team.id())).to(eq(@test_team))
    end
  end

  describe("#add_member") do
    it("adds a new member to a team") do
      @test_team.save()
      test_member = Member.new({
        :name=>"Jeffrey Li",
        :mobile=>23456789,
        :email=>"jeffrey.li@gmail.com",
        :photo=>"url"})
      @test_team.add_member(test_member)
      expect(@test_team.members()).to(eq([test_member]))
    end
  end

end
