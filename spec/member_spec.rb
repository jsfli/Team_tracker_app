require('rspec')
require('member')

describe(Member) do

  before() do
    @test_member = Member.new({
      :name=>"Jeffrey Li",
      :mobile=>23456789,
      :email=>"jeffrey.li@gmail.com"})
  end

  describe("#initialize") do
    it("set the parameters of a new member") do
      expect(@test_member.name()).to(eq("Jeffrey Li"))
      expect(@test_member.mobile()).to(eq(23456789))
      expect(@test_member.email()).to(eq("jeffrey.li@gmail.com"))
    end
  end

  describe(".all") do
    it("member array is empty at first") do
      expect(Member.all()).to(eq([]))
    end
  end

end #end of Member class describe
