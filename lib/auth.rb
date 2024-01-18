require "bcrypt"

module Auth
  def self.create_hash(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash(hashed_password, plain_password)
    BCrypt::Password.new(hashed_password) == plain_password
  end

  def self.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      found_username = user_record.username == username
      hash_password = user_record.password
      match_password = self.verify_hash(hash_password, password)

      return user_record if found_username && match_password
    end

    return nil
  end
end