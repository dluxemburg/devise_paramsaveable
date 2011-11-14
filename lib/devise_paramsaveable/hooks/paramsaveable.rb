Warden::Manager.after_set_user do |user, auth, opts|
  if user.saveable_params.present?
    request = Rack::Request.new(auth.env)
    user.saveable_params.each do |p|
      if(request.params[p[:name]].present?)
        puts '[devise_paramsaveable] writing '+p[:name]+' attribute to be '+request.params[p[:name]]
        user.write_attribute(p[:name],request.params[p[:name]])
      elsif p[:clear_on_empty] == true
        user.write_attribute(p[:name],nil)
      end
    end
    user.save!
  end
end