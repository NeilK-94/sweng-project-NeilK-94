require 'rails_helper'

describe Game do
  context 'validation test on game' do
    it 'ensures title presence' do
        game = Game.new(genre: 'test', score: 54, developer: 'test').save
        expect(game).to eq(false)   #   title presence is set to required in 'game.rb'
    end
    it 'ensures score presence' do
        game = Game.new(title: 'test', genre: "test", developer: 'test').save
        expect(game).to eq(false)   #   score presence is set to required in 'game.rb'
    end
  end
end
