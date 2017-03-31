class Member

  @@members = []

  define_method(:initialize) do |attributes|
    @name   = attributes.fetch(:name)
    @mobile = attributes.fetch(:mobile)
    @email  = attributes.fetch(:email)
    @id ==@@members.length().+(1)
  end

  attr_reader(:name, :mobile, :email, :id)

  define_singleton_method(:all) do
    @@members
  end
  
end#end of class
