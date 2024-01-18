require_relative "auth.rb"

class User
  @@users = []

  attr_accessor :id, :username, :password

  def initialize(username, password)
    @username = username
    # @password = password
    @password = Auth.create_hash(password)
    @id = @@users.length + 1

    @@users << self
  end

  # returns all the users from array
  def self.all
    @@users
  end

  # populates the Users array
  def self.seed
    users = [{username: "mary", password: "password1"}]

    users.each do |user|
      User.new(user[:username], user[:passwrod])
    end
  end

  def self.find(id)
    self.all.find { |user| user.id == id }
  end
end