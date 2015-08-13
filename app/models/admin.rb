class Admin < ActiveRecord::Base
    validates_uniqueness_of :username
    before_save :create_hashed_password
    after_save :a_save
    before_destroy :b_destroy
    attr_accessor :password
    # protected :hashed_password, :salt


    def create_hashed_password
      unless password.blank?
        self.salt = Admin.make_salt(username) if salt.blank?
        self.hashed_password = Admin.hash_with_salt(password, salt)
      end
    end

    def a_save
      self.password=nil
    end

    def b_destroy
      return false if self.id == 1
    end

    def full_name
      self.first_name+" "+self.last_name
    end

    def self.authenticate(username="", password="")
      user = Admin.find_by_username(username)
      if user && user.password_match?(password)
        return user
      else
        return false
      end
    end

    def password_match?(password="")
      self.hashed_password == Admin.hash_with_salt(password, salt)
    end

    private
    def self.make_salt(username="")
      Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
    end

    def self.hash_with_salt(password, salt)
      Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    end
  end


