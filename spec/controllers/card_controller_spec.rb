require 'rails_helper'

RSpec.describe CardController, :type => :controller do

  describe "GET view" do
    it "returns http success" do
      get :view
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET post" do
    it "returns http success" do
      get :post
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
