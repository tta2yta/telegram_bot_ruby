class User
  attr_reader :name
  attr_reader :id

  def initialize
    @name = ''
    @id = 432
  end

  def user_name(name)
    @name = name
  end
end
