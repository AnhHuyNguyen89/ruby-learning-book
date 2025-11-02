class User
  attr_accessor :firstName, :lastName, :email

  def initialize(attributes = {})
    @firstName = attributes([ :firstName ])
    @lastName = attributes([ :lastName ])
    @email = attributes([ :email ])
  end

  def full_name
    "#{@firstName} #{@lastName}"
  end

  def alphabetical_name
    "#{@firstName}, #{@lastName}"
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end
