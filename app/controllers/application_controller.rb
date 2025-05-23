class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] == "pages"
    # ~ /(^(rails_)?admin)|(^pages$)/
  end
end
