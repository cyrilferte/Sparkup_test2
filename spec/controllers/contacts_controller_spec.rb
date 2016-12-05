require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all contacts as @contacts" do
      contact = Contact.create!
      get :index, params: {}
      expect(assigns(:contacts)).to eq([contact])
    end
  end

end
