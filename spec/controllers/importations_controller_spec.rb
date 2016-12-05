require 'rails_helper'

RSpec.describe ImportationsController, type: :controller do

  let(:valid_attributes) {
    {
      file: fixture_file_upload('/files/@ contacter.xlsx')
    }
  }

  let(:no_file_uploaded) {
    {
      file: nil
    }
  }


  let(:valid_session) { {} }

  

  describe "GET #show" do
    it "assigns the requested import as @import" do
      importation = Importation.create! valid_attributes
      get :show, params: {id: importation.to_param}, session: valid_session
      expect(assigns(:importation)).to eq(importation)
    end
  end

  describe "GET #new" do
    it "assigns a new import as @import" do
      get :new, params: {}, session: valid_session
      expect(assigns(:importation)).to be_a_new(Importation)
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Importation" do
        expect {
          post :create, params: {importation: valid_attributes}, session: valid_session
        }.to change(Importation, :count).by(1)
      end

      it "assigns a newly created importation as @importation" do
        post :create, params: {importation: valid_attributes}, session: valid_session
        expect(assigns(:importation)).to be_a(Importation)
        expect(assigns(:importation)).to be_persisted
      end

      it "redirects to the created importation" do
        post :create, params: {importation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Importation.last)
      end
    end

    context "with no file uploaded" do
      it "assigns a newly created but unsaved importation as @importation" do
        post :create, params: {import: no_file_uploaded}, session: valid_session
        expect(assigns(:importation)).to be_a_new(Importation)
      end

      it "re-renders the 'new' template" do
        post :create, params: {importation: no_file_uploaded}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

   
  end

end
