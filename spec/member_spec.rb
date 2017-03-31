require('rspec')
require('member')

describe(Member) do

  before() do
    Member.clear()
    @test_member = Member.new({
      :name=>"Jeffrey Li",
      :mobile=>23456789,
      :email=>"jeffrey.li@gmail.com",
      :photo=>"url"})
  end

  describe("#initialize") do
    it("set the parameters of a new member") do
      expect(@test_member.name()).to(eq("Jeffrey Li"))
      expect(@test_member.mobile()).to(eq(23456789))
      expect(@test_member.email()).to(eq("jeffrey.li@gmail.com"))
      expect(@test_member.photo()).to(eq("url"))

    end
  end

  describe(".all") do
    it("member array is empty at first") do
      expect(Member.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a member to the array of members") do
      @test_member.save()
      expect(Member.all()).to(eq([@test_member]))
    end
  end

  describe('.clear') do
    it("empties out the array of Members") do
      @test_member.save()
      Member.clear()
      expect(Member.all()).to(eq([]))
    end
  end

end #end of Member class describe
