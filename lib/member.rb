class Member

  @@members = []

  define_method(:initialize) do |attributes|
    @name   = attributes.fetch(:name)
    @mobile = attributes.fetch(:mobile)
    @email  = attributes.fetch(:email)
    @photo = attributes.fetch(:photo)
    @id ==@@members.length().+(1)
  end

  attr_reader(:name, :mobile, :email, :photo,:id)

  define_singleton_method(:all) do
    @@members
  end

  define_method(:save) do
    @@members.push(self)
  end

  define_singleton_method(:clear) do
    @@members=[]
  end

end#end of class
