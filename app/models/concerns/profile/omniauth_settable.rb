class Profile < ActiveRecord::Base
  module OmniauthSettable
    def info=(hash)
      [:nickname, :email, :description, :name, :image, :urls, :location].each do |field|
        send "#{field}=", hash[field]
      end
    end
    def credentials=(hash)
      self.token_access = hash["token"]
      self.token_secret = hash["secret"]
    end
    def extra=(hash)
      self.raw_info = hash[:raw_info]
    end
  end
end
