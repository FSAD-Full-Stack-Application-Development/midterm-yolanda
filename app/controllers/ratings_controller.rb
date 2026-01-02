class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :check_owner, only: %i[ edit update destroy ]

  # GET /ratings or /ratings.json
  def index
    @ratings = current_user.ratings.includes(:recipe)
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @rating = @recipe.ratings.build(rating_params)
    @rating.user = current_user
    
    if @rating.save
      redirect_to @recipe, notice: "Rating submitted successfully!"
    else
      # Store the user rating attempt for the view
      @user_rating = nil
      flash.now[:alert] = "Please correct the following errors: " + @rating.errors.full_messages.join(", ")
      render 'recipes/show', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating.recipe, notice: "Rating was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @recipe = @rating.recipe
    @rating.destroy!

    respond_to do |format|
      format.html { redirect_to @recipe, notice: "Rating was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params.expect(:id))
    end

    # Check if current user owns the rating
    def check_owner
      unless @rating.user == current_user
        redirect_to @rating.recipe, alert: "You can only modify your own ratings."
      end
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.expect(rating: [ :score, :content ])
    end
end
