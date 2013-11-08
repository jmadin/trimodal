class ContributorsController < ApplicationController
  # before_action :signed_in_contributor, only: [:index, :edit, :update, :show]
  # before_action :correct_contributor,   only: [:edit, :update]
  # before_action :admin_contributor,     only: [:destroy, :new]

  def index
    @contributors = Contributor.all.sort_by{ |h| h.last_name }
  end

  def show
      @contributor = Contributor.find(params[:id])      
  end
    
  def new
    @contributor = Contributor.new
  end

  def edit
    @contributor = Contributor.find(params[:id])
  end

  def destroy
    Contributor.find(params[:id]).destroy
    flash[:success] = "Contributor removed"
    redirect_to contributors_url
  end

  def update
    if @contributor.update_attributes(contributor_params)
      flash[:success] = "Profile updated"
      sign_in @contributor
      redirect_to @contributor
    else
      render 'edit'
    end
  end
  
  def create
    @contributor = Contributor.new(contributor_params)
    if @contributor.save
      sign_in @contributor
      flash[:success] = "Welcome to the Coral Traits Database."
      redirect_to @contributor
    else
      render 'new'
    end
  end

  private

    def contributor_params
      params.require(:contributor).permit(:first_name, :last_name, :short_name, :email, :phone, :contributor_profile, :institution, :country, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_contributor
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_contributor
      @contributor = Contributor.find(params[:id])
      redirect_to(root_url) unless current_contributor?(@contributor)
    end

    def admin_contributor
      redirect_to(root_url) unless current_contributor.admin?
    end

end
