require 'devise_paramsaveable/hooks/paramsaveable'

module Devise
  module Models
    module DeviseParamsaveable
      def saveable_params
        return []
      end
    end
  end
end