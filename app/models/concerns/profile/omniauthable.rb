class Profile < ActiveRecord::Base
  module Omniauthable
    extend ActiveSupport::Concern

    module ClassMethods
      def create_or_update_from_omniauth(hash)
        where(uid: hash[:uid]).first_or_initialize.tap do |profile|
          raise "not so fast, sweetie"
          hash.each do |key, value|
            profile.send "#{key}=", value
          end
          profile.user = User.create_or_update_from_profile profile
          profile.save!
        end
      end
    end
  end
end
