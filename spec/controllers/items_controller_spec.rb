require 'rails_helper'
describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      get :edit
      expect(response).to render_template :edit
    end
  end

  describe 'GET #update' do
    it "renders the :update template" do
      get :update
      expect(response).to render_template :update
    end
  end
end
