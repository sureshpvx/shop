class SessionsController < ApplicationController
  def new
    # This action just shows the login form.
  end

  def create
    # Step 1: Find the user by their email address.
    user = User.find_by(email: params[:email].downcase)

    # Step 2: Check if the user was found AND if the password is correct.
    # The .authenticate method is a gift from has_secure_password.
    if user && user.authenticate(params[:password])
      # Step 3: Success! Save the user's ID in the session cookie.
      # This is what keeps the user logged in.
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      # Step 3: Failure. Show an error message and re-render the login form.
      flash.now[:alert] = 'Invalid email or password.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # To log out, we simply clear the user's ID from the session.
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end