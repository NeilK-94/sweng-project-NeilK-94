require 'rails_helper'

describe GamesController, type: 'controller' do
  describe "GET requests" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    # it "renders the show template" do
    #   game get '/games/:id'
    #   get :show
    #   expect(response).to render_template("show")
    # end
    # it "renders the edit template" do
    #   put '/games/:id'
    #   expect(response).to render_template("edit")
    # end
  end
#   describe 'developer' do
#     it 'should call the model method that finds movies with same director' do
#       expect(Game).to receive(:find_with_same_developer).with('dev')    #   stub
#       get :search_dev, {:search_terms => 'dev'}
#     end
#   end
end