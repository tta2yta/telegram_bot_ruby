class User
  attr_reader :name

  def initialize
    @name = ''
  end

  def user_name(name)
    @name = name
  end
end
