class ContratsController < ApplicationController
  before_action :set_contrat, only: %i[ show edit update destroy remplacement assistanat collaboration statu ]
  before_action :authenticate_user!
  before_action :set_status, only: [ :remplacement, :show, :assistanat, :collaboration ]
  # GET /contrats or /contrats.json
  def index
    @contrats = current_user.contrats.limit(5)
  end

  # GET /contrats/1 or /contrats/1.json
  def show
    respond_to do |format|
      format.html
    end
  end
  
  # GET /contrats/new
  def new
    @contrat = current_user.contrats.build(contrat_params)
  end

  # GET /contrats/1/edit
  def edit
  end

  # POST /contrats or /contrats.json
  def create
    # Créer un nouveau contrat
    information = current_user.information
    @contrat = information.contrats.build(contrat_params)
    @contrat.user_id = current_user.id
    respond_to do |format|
      if @contrat.save
        format.html { redirect_to contrat_url(@contrat), notice: "Contrat créé avec succès." }
        format.json { render :show, status: :created, location: @contrat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contrat.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /contrats/1 or /contrats/1.json
  def update
    respond_to do |format|
      if @contrat.update(contrat_params)
        format.html { redirect_to contrat_url(@contrat), notice: "Contrat mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @contrat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contrat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contrats/1 or /contrats/1.json
  def destroy
    @contrat.destroy

    respond_to do |format|
      format.html { redirect_to contrats_url, notice: "Contrat supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  def remplacement
    data = {
      "Madame" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "ou Monsieur" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "Née le" => @first_person.birthday.strftime('%d/%m/%Y'),
      "à" => @first_person.place_birth,
      "Inscrit e au tableau du Conseil départemental de lordre de" => @first_person.registered_ordre,
      "sous le numéro" => @first_person.n_ordinal,
      "Adresse professionnelle" => @first_person.address_pro,
      "Adresse électronique" => @contrat.status == "perso_1" ? current_user.email : @contrat.email,
      "Madame_2" => @second_person.gender == "Madame" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "ou Monsieur_2" => @second_person.gender == "Monsieur" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "Née le_2" => @second_person.birthday.strftime('%d/%m/%Y'),
      "à_2" => @second_person.place_birth,
      "Inscrite au tableau du Conseil départemental de lordre de" => @second_person.registered_ordre,
      "sous le numéro_2" => @second_person.n_ordinal,
      "Demeurant" => @second_person.address_pro,
      "Adresse électronique_2" => @contrat.status == "perso_2" ? current_user.email : @contrat.email,
      "Madame_3" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "ou Monsieur_3" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "Madame_4" => @second_person.gender == "Madame" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "masseurkinésithérapeute de lela remplacer pendant" => @second_person.gender == "Monsieur" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "Conformément à larticle R 4321107 alinéa 3 du code de la santé publique Madame" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "ou Monsieur_4" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "Madame_5" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "ou Monsieur_5" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "Madame_6" => @second_person.gender == "Madame" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "ou Monsieur_6" => @second_person.gender == "Monsieur" ? "#{@second_person.name} #{@second_person.first_name}" : "",
      "Madame_7" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "en" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
      "Le présent contrat prendra effet le" => @contrat.start_date.strftime('%d/%m/%Y'),
      "et se terminera le" => @contrat.end_date.strftime('%d/%m/%Y'),
      "Sur le total des honoraires perçus et facturés pendant le remplacement le remplacé en" => @contrat.retro,
      "versement" => "#{@contrat.payment_limit} de chaque mois",
      "Par conséquent le remplaçant sinterdit toute installation à titre libéral dans un rayon de" => "#{@contrat.rayon_install}km",
      "kinésithérapeutes de" => @contrat.conflict_order,
      "Fait le" => @contrat.made_on.strftime('%d/%m/%Y'),
      "A" => @contrat.to
    }
    pdf_path = "public/contrat_template/rempla_edit.pdf"
    filled_pdf_path = "public/contrat_template/remplacement.pdf"
    @pdf.fill_form(pdf_path, filled_pdf_path, data)
    send_file filled_pdf_path, type: 'application/pdf', disposition: 'attachment'
  end

def assistanat
  data = {
    "Madame" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
    "ou Monsieur" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
    "Née le" => @first_person.birthday.strftime('%d/%m/%Y'),
    "à" => @first_person.place_birth,
    "Inscrit e au tableau du Conseil départemental de lordre de" => @first_person.registered_ordre,
    "sous le numéro" => @first_person.n_ordinal,
    "Adresse professionnelle" => @first_person.address_pro,
    "Adresse électronique" => @contrat.status == "perso_1" ? current_user.email : @contrat.email,
    "Madame_2" => @second_person.gender == "Madame" ? "#{@second_person.name} #{@second_person.first_name}" : "",
    "ou Monsieur_2" => @second_person.gender == "Monsieur" ? "#{@second_person.name} #{@second_person.first_name}" : "",
    "Née le_2" => @second_person.birthday.strftime('%d/%m/%Y'),
    "à_2" => @second_person.place_birth,
    "Inscrite au tableau du Conseil départemental de lordre de" => @second_person.registered_ordre,
    "sous le numéro_2" => @second_person.n_ordinal,
    "Demeurant" => @second_person.address_pro,
    "Adresse électronique_2" => @contrat.status == "perso_2" ? current_user.email : @contrat.email,
    "MadameMonsieur" => "#{@first_person.name} #{@first_person.first_name}",
    "MadameMonsieur_2" => "#{@second_person.name} #{@second_person.first_name}",
    "dassistanat" => @first_person.address_pro,
    "undefined_4" => "#{@first_person.name} #{@first_person.first_name}",
    "Lassistant libéral MadameMonsieur" => "#{@second_person.name} #{@second_person.first_name}",
    "undefined_5" => "#{@first_person.name} #{@first_person.first_name}",
    "La présente convention entrera en vigueur le" => @contrat.start_date.strftime('%d/%m/%Y'),
    "pour une durée de" => "#{(@contrat.end_date.year * 12 + @contrat.end_date.month) - (@contrat.start_date.year * 12 + @contrat.start_date.month) + 1} mois",
    "undefined_6" => @contrat.n_urssaf,
    "undefined_7" => @contrat.retro,
    "de chaque mois11" => @contrat.payment_limit,
    "refus" => @contrat.nb_refus,
    "refus successifs du titulaire lassistant libéral pourra librement choisir son remplaçant Lassistant libéral" => @contrat.nb_refus,
    "En cas de cessation des relations contractuelles lassistant libéral sinterdira dexercer sa profession à" => @contrat.blackout_period,
    "sur un rayon de" => "#{@contrat.rayon_install}km",
    "départemental" => @contrat.conflict_order,
    "de" => @contrat.conflict_order,
    "Fait le" => @contrat.made_on.strftime('%d/%m/%Y'),
    "A" => @contrat.to
  }
  pdf_path = "public/contrat_template/assistanat.pdf"
  filled_pdf_path = "public/contrat_template/assistanat_edit.pdf"
  @pdf.fill_form(pdf_path, filled_pdf_path, data)
  send_file filled_pdf_path, type: 'application/pdf', disposition: 'attachment'
end

def collaboration
  data = {
  "Madame" => @first_person.gender == "Madame" ? "#{@first_person.name} #{@first_person.first_name}" : "",
  "ou Monsieur" => @first_person.gender == "Monsieur" ? "#{@first_person.name} #{@first_person.first_name}" : "",
  "Née le" => @first_person.birthday.strftime('%d/%m/%Y'),
  "Inscrit e au tableau du Conseil départemental de lordre de" => @first_person.registered_ordre,
  "sous le numéro" => @first_person.n_ordinal,
  "Adresse professionnelle" => @first_person.address_pro,
  "Adresse électronique" => @contrat.status == "perso_1" ? current_user.email : @contrat.email,
  "Madame_2" => @second_person.gender == "Madame" ? "#{@second_person.name} #{@second_person.first_name}" : "",
  "ou Monsieur_2" => @second_person.gender == "Monsieur" ? "#{@second_person.name} #{@second_person.first_name}" : "",
  "Née le_2" => @second_person.birthday.strftime('%d/%m/%Y'),
  "Inscrit e au tableau du Conseil départemental de lordre de_2" => @second_person.registered_ordre,
  "sous le numéro_2" => @second_person.n_ordinal,
  "Demeurant" => @second_person.address_pro,
  "Adresse électronique_2" => @contrat.status == "perso_2" ? current_user.email : @contrat.email,
  "de" => @first_person.address_pro,
  "La présente convention entrera en vigueur le" => @contrat.start_date.strftime('%d/%m/%Y'),
  "de_2" => "#{(@contrat.end_date.year * 12 + @contrat.end_date.month) - (@contrat.start_date.year * 12 + @contrat.start_date.month) + 1} mois",
  "Le collaborateur déclare être immatriculé en qualité de travailleur indépendant auprès de" => @contrat.n_urssaf,
  "undefined_6" => @contrat.retro,
  "de chaque mois12" => @contrat.payment_limit,
  "refus successifs du titulaire le collaborateur pourra librement" => @contrat.nb_refus,
  "Le" => @contrat.nb_refus,
  "Après la cessation de la collaboration une interdiction dexercice libéral ou en salariat du" => "#{@contrat.rayon_install}km",
  "collaborateur dans un rayon de" => "#{@contrat.blackout_period} mois",
  "masseurskinésithérapeutes" => @contrat.conflict_order,
  "contrat ainsi que tout avenant sera communiqué au conseil départemental de lordre des" => @contrat.conflict_order,
  "Fait le" => @contrat.made_on.strftime('%d/%m/%Y'),
  "A" => @contrat.to
}
  pdf_path = "public/contrat_template/collaboration.pdf"
  filled_pdf_path = "public/contrat_template/collab_edit.pdf"
  @pdf.fill_form(pdf_path, filled_pdf_path, data)
  send_file filled_pdf_path, type: 'application/pdf', disposition: 'attachment'
end

  private
    def set_status
      @pdf = PdfForms.new('/opt/homebrew/bin/pdftk')
      @user = current_user.information
      if @contrat.status == "perso_1"
        @first_person = @user
        @second_person = @contrat
      elsif @contrat.status == "perso_2"
        @first_person = @contrat
        @second_person = @user
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contrat
      @contrat = Contrat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contrat_params
      params.fetch(:contrat, {}).permit(:name_contrat, :information_id, :user_id, :gender, :name, :first_name, :birthday, :place_birth, :registered_ordre, :n_ordinal, :address_pro, :email, :start_date, :end_date, :retro, :payment_limit, :rayon_install, :conflict_order, :made_on, :to, :n_urssaf, :nb_refus, :blackout_period, :status)
    end
end
