require 'devise_paramsaveable/hooks/paramsaveable'

module Devise
  module Models
    module Paramsaveable
      def saveable_params
        return []
      end
    end
  end
end