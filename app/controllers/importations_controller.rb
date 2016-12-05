class ImportationsController < ApplicationController
    
  def index
    @importations = Importation.all.order(:created_at).reverse
  end

  def show
    @importation = Importation.find(params[:id])
    @contactsimp = Contact.where(importation_id: @importation.id)
  end

  def new
    @importation = Importation.new
  end

  def create
    @importation = Importation.new(importation_params)


    # Hack around Rails 5 reversion, see:
    # https://github.com/rails/rails/issues/17947#issuecomment-227581029
    unless importation_params[:file].is_a? ActionDispatch::Http::UploadedFile
      redirect_to(new_importation_path, notice: t('.file_cannot_be_empty')) and return
    end



    respond_to do |format|
      if @importation.save
        Contact.savecontact @importation
        format.html { redirect_to @importation, notice: t('.file_uploaded_contacts_being_created.') }
        format.json { render :show, status: :created, location: @importation }
      else
        format.html { render :new }
        format.json { render json: @importation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def importation_params
      params.require(:importation).permit(:file)
    end
end
