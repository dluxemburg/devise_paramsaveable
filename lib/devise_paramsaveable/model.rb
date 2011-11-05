require 'devise_lastseenable/hooks/lastseenable'

module Devise
  module Models
    module Lastseenable
      self.savable_params = []
    end
  end
end