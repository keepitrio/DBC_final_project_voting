require 'rails_helper'

RSpec.describe PitchesController, type: :controller do
  let!(:student) { Pitch.create!(title: "Costpers", description: "Find the value of your purchase") }
  let!(:team) { Pitch.create!(title: "Costpers", description: "Find the value of your purchase") }
  let!(:pitch) { Pitch.create!(title: "Costpers", description: "Find the value of your purchase") }

  describe "GET #index" do 
    before(:each) { get :index }

    it "responds with status code 200" do 
      expect(response).to have_http_status(200)
    end 

    it "renders the index page" do 
      get :index
      expect(response).to have_rendered('pitches/index')
    end 
  end
  describe "GET #new" do
    before(:each) { get :new }
    it "responds with status code 200" do
      expect(response).to have_http_status(200)
    end

    it "assigns a new pitch to @pitch" do
      expect(assigns(:pitch)).to be_a_new Pitch
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      before(:each) do 
        post(:create)
      end 
      it "responds with status code 302" do
        expect(response).to have_http_status(302)
      end
    end
  end 
end 
#     it "creates a new pitch in the database" do
#       expect { post :create, { pitch: { title: "Costpers", description: "Find the value of your purchase" } } }.to change(Pitch, :count).by(1)
#     end

#     it "redirects to the created pitch" do
#       expect(response).to redirect_to pitch_path(Pitch.last.id)
#     end
#   end
# end
