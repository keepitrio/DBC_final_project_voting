require 'rails_helper'

RSpec.describe PitchesController, type: :controller do
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
    before(:each) { post :create, { pitch: { title: "Costpers", description: "Find the value of your purchase" } } }
    context "when valid params are passed" do
    it "responds with status code 302" do
      expect(response).to have_http_status(302)
    end

    it "creates a new pitch in the database" do
      expect { post :create, { pitch: { title: "Costpers", description: "Find the value of your purchase" } } }.to change(Pitch, :count).by(1)
    end

    it "redirects to the created pitch" do
      expect(response).to redirect_to pitch_path(Pitch.last.id)
    end
  end

    # context "when invalid params are passed" do
    #   before(:each) { post :create, { pitch: { description: "Find the value of your purchase" } }
    #   it "responds with status code 422: Unprocessable Entity" do
    #     expect(response).to have_http_status 422
    #   end

    #   it "does not create a new pitch in the database" do
    #     expect{Pitch.all.count}.not_to change(Pitch, :count)
    #   end

    #   it "renders the :new template" do
    #     expect(response).to have_rendered('pitches/new')
    #   end
    # end




#   describe "GET #index" do
#     before(:each) { get :index }
#     it "responds with status code 200" do
#       expect(response).to have_http_status(200)
#     end

#     it "assigns the recent games as @games" do
#       4.times { Game.create!(user_throw: Game::THROWS.sample) }
#       expect(assigns(:games).length).to eq 5
#     end

#     it "renders the :index template" do
#       expect(response).to have_rendered('games/index')
#     end
#   end

#   describe "GET #show" do
#     it "responds with status code 200" do
#       get :show, { id: game.id }
#       expect(response).to have_http_status 200
#     end

#     it "assigns the correct game as @game" do
#       get :show, { id: game.id }
#       expect(assigns(:game)).to eq(game)
#     end

#     it "renders the :show template" do
#       get :show, { id: game.id }
#       expect(response).to render_template(:show)
#     end
#   end


  

#   describe "DELETE #destroy" do
#     it "responds with status code 302" do
#       delete :destroy, { id: game.id }
#       expect(response).to have_http_status 302
#     end

#     it "destroys the requested game" do
#       expect { delete(:destroy, { id: game.id }) }.to change(Game, :count).by(-1)
#     end

#     it "sets a notice that the game was destroyed" do
#       delete :destroy, { id: game.id }
#       expect(flash[:notice]).to match /Game was successfully destroyed/
#     end

#     it "redirects to the games list" do
#       delete :destroy, { id: game.id }
#       expect(response).to redirect_to games_url
#     end
#   end
# end