class WelcomeController < ApplicationController
  def index
    if current_user&.manager?
      redirect_to team_permit_submissions_path(current_user.team)
    else
      redirect_to permit_submissions_path
    end
  end
end
