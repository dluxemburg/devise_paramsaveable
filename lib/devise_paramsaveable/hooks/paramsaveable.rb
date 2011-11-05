Warden::Manager.after_set_user do |user, auth, opts|
  if user.saveable_params.present?
    request = Rack::Request.new(env)
    user.saveable_params.each do |p|
      if(request.params[p.name])
        user[p.name] = request.params[p.name]
      elsif p.clear_on_empty == true
        user[p.name] = nil
      end
    end
  end
end