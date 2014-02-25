class HeaderCharacter < ActiveRecord::Base
  module Caching
    extend ActiveSupport::Concern

    module ClassMethods
      def cached_all
        all
      end
    end
  end
end
