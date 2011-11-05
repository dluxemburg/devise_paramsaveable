Warden::Manager.after_set_user do |user, auth, opts|
  if record.save_params.present?
    request = Rack::Request.new(env)
    record.saveable_params.each do |p|
      if(request.params[p.name])
        record[p.name] = request.params[p.name]
      elsif p.name.clear_on_empty == true
        record[p.name] = nil
      end
    end
  end
end