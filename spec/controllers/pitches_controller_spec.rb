require 'rails_helper'

RSpec.describe PitchesController, type: :controller do
  describe "GET #index" do 
    before(:each) { get :index }
    it "responds with status code 200" do 
      expect(response).to have_http_status(200)
    end 

    it "renders the index page" do 
      get :index
      expect(response).to have_rendered('games/index')
    end 
  end
end



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

#   describe "GET #new" do
#     before(:each) { get :new }
#     it "responds with status code 200" do
#       expect(response).to have_http_status(200)
#     end

#     it "assigns a new game to @game" do
#       expect(assigns(:game)).to be_a_new Game
#     end

#     it "renders the :new template" do
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "POST #create" do
#     before(:each) { post :create, { game: { user_throw: "rock" } } }
#     context "when valid params are passed" do
#       it "responds with status code 302" do
#         expect(response).to have_http_status(302)
#       end

#       it "creates a new game in the database" do
#         expect{ post :create, { game: { user_throw: "rock" } } }.to change(Game, :count).by(1)
#       end

#       it "assigns the newly created game as @game" do
#         expect(assigns(:game).user_throw).to eq("rock")
#       end

#       it "sets a notice that the game was successfully created" do
#         expect(flash[:notice]).to eq 'Game was successfully created.'
#       end

#       it "redirects to the created game" do
#         expect(response).to redirect_to game_path(Game.last.id)
#       end
#     end

#     context "when invalid params are passed" do
#       before(:each) { post :create, { game: { user_throw: "pineapple" } } }
#       it "responds with status code 422: Unprocessable Entity" do
#         expect(response).to have_http_status 422
#       end

#       it "does not create a new game in the database" do
#         expect{Game.all.count}.not_to change(Game, :count)
#       end

#       it "assigns the unsaved game as @game" do
#         expect(assigns(:game)).to be_a_kind_of Game
#       end

#       it "renders the :new template" do
#         expect(response).to have_rendered('games/new')
#       end
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