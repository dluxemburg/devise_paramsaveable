unless defined?(Devise)
  require 'devise'
end
require 'devise_paramsaveable'

Devise.add_module :lastseenable, :model => 'devise_paramsaveable/model'

module DeviseParamsaveable
end

require 'devise_paramsaveable/rails'