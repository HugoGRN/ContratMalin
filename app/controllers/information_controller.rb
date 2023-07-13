class InformationController < ApplicationController
  before_action :set_information, only: %i[ show edit update destroy ]
  before_action :require_login
  before_action :require_permission, only: %i[ show edit update destroy ]

  # GET /information or /information.json
  def index
    @information = current_user.information
  end

  # GET /information/1 or /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = current_user.build_information
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information or /information.json
  def create
    @information = current_user.information.build(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to information_url(@information), notice: "Fiche Information crée" }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1 or /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to information_url(@information), notice: "Information was successfully updated." }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1 or /information/1.json
  def destroy
    @information.destroy

    respond_to do |format|
      format.html { redirect_to information_index_url, notice: "Information was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    def require_login
      unless current_user
        flash[:error] = "Vous devez être connecté pour accéder à cette section."
        redirect_to new_user_session_path # rediriger vers la page de connexion
      end
    end

    def require_permission
      unless current_user.information.id == @information.id
        flash[:error] = "Vous n'êtes pas autorisé à effectuer cette action."
        redirect_to information_path # rediriger vers la page d'information
      end
    end
    
    # Only allow a list of trusted parameters through.
    def information_params
      params.require(:information).permit(:name, :first_name, :birthday, :place_birth, :gender, :diploma, :graduation_date, :place_diploma, :n_ordinal, :registered_ordre, :address_pro, :name_street, :street_number, :address_complement, :zip_code, :city, :country, :usage_name, :nationality, :n_secu, :rpps)
    end
end
