class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def index
    @profiles = Profile.all
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      # After saving the profile, redirect to the profile's show page
      redirect_to @profile, notice: 'Profile created successfully.'
    else
      # If save fails, render the 'new' template again
      render :new
    end
  end

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
  @profile = current_user.profile || current_user.build_profile
  if @profile.update(profile_params)
    redirect_to root_path, notice: 'Profile updated successfully.'
  else
    render :edit
  end
end

  private

  def profile_params
    params.require(:profile).permit(:name, :contact_no, :age, :gender)
  end
end
