class User < ActiveRecord::Base
  module Authenticable
    extend ActiveSupport::Concern

    module ClassMethods
      def create_or_update_from_omniauth(hash)
        profile = Profile.create_or_update_from_omniauth hash
        profile.user
      end

      def create_or_update_from_profile(profile)
        if profile.user_id
          # we only update image as the user might have already entered his name and email
          find(profile.user_id).tap do |user|
            user.update_attributes! imagen: profile.image
          end
        else
          profile_attributes = {
            nombres: profile.name,
            email: profile.email,
            imagen: profile.image
          }
          create! profile_attributes
        end
      end
    end
  end
end
