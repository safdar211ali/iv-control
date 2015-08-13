class StaffController < AdmController
  # layout 'staff'
  before_filter :authorize_access, :except => [:login, :send_login, :index]
  def index
    login
    render :action => :login
  end

  def login
    if params[:ur]
      @admin = Admin.new
    elsif params[:admin]
      @admin = User.new(admin_params)
      if @admin.save
        flash[:notice]='User was successfully created.'
        redirect_to :action => :login
      else
        render :action => :login
      end
    end
  end

  def send_login
    authorized_user = Admin.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id]=authorized_user.id
      session[:username]=authorized_user.username
      flash[:notice] = 'You are now logged in.'
      redirect_to :action => :welcome
    else
      flash[:notice]='Username/password combination incorrect. Please
      make sure your caps lock key is off and try again.'
      render :action => :login
    end
  end

  def welcome

  end

  def logout
    session[:user_id]=nil
    session[:username]=nil
    flash[:notice]='You are logged out now.'
    redirect_to :action => :login
  end
  private
  def admin_params
    params.require(:user).permit(:username,:password)
  end
end
