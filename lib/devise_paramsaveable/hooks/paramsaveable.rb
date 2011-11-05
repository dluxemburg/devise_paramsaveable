Warden::Manager.after_set_user do |user, auth, opts|
  if user.saveable_params.present?
    request = Rack::Request.new(auth.env)
    user.saveable_params.each do |p|
      if(request.params[p[:name].to_s].present?)
        user[p[:name]] = request.params[p[:name].to_s]
      elsif p[:clear_on_empty] == true
        user[p[:name]] = nil
      end
    end
    user.save()
  end
end