class SignupController < ApplicationController

  def new
    session[:redirect_to] = session[:redirect_to] || params["redirect_to"]
    session[:host_name] = session[:host_name] || params["host_name"]
    @host_name = session[:host_name]
  end

  def create
    # params.permit!
    if params[:email].empty?
      signup_error("Email can't be empty")
    elsif params[:password].empty?
      signup_error("Password can't be empty")
    elsif params[:password] != params[:password_confirmation]
      signup_error("Password and password confirmation don't match")
    elsif user[:id].present?
      signup_error("Account alreaddy created")
    elsif user[:id].nil?
      redirect_to = session[:redirect_to]
      session.delete :redirect_to
      session.delete :host_name
      user = create_user
      redirect_to redirect_to + "?id=#{user[:uuid]}"
      return
    end

    redirect_back fallback_location: root_path
  end

  def user
    @user ||= get_user(params[:email])
  end

  def signup_error(message)
    flash[:error] = message
  end

  def get_user(email)
    headers = {
      "Email"  => email
    }

    response =
      HTTParty
      .get(
        public_ledger[:url] + '/api/v1/user_by_email/'+ SecureRandom.uuid,
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)
  end

  def new_user
    response =
      HTTParty
      .get(
        public_ledger[:url] + '/api/v1/user/new',
        format: :plain)
    JSON.parse( response, symbolize_names: true)
  end

  def create_user
    user = User.new(password: params[:password])
    headers = {
      "Email"  => params[:email],
      "PasswordDigest" => user.password_digest
    }

    response =
      HTTParty
      .post(
        public_ledger[:url] + '/api/v1/users/',
        format: :plain,
        headers: headers)
    JSON.parse( response, symbolize_names: true)
  end

  def public_ledger
    @public_ledger ||= System::Host.public_ledger
  end

end
