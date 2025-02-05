class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    if auth.present?
      user = User.from_google(from_google_params)

      if user.present?
        sign_out_all_scopes
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_session_path
      end
    else
      flash[:alert] = "Authentication failed. Please try again."
      redirect_to new_user_session_path
    end
  end

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def failure
    flash[:error] = "Authentication failed. Please try again."
    redirect_to root_path
  end
end
