class UsersController < ApplicationController
  def login_with_facebook
    data = load_facebook_data(params[:access_token])
    data = data.rewrite('id' => 'fb_id').slice('fb_id','first_name','last_name','email','gender')

    self.current_user = if user = User.find_by_fb_id(data['fb_id'])
      user
    else
      User.create!(data)
    end

    redirect_to session[:redirect_after_login] || root_path
    session[:redirect_after_login] = nil
  end

  def logout
    self.current_user = nil
    redirect_back_or_default '/'
  end

  private

  def load_facebook_data(access_token)
    url = "https://graph.facebook.com/me?access_token=#{access_token}"
    ActiveSupport::JSON.decode(`curl --insecure '#{url}'`)
  end
end
