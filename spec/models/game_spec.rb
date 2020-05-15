require 'rails_helper'

describe Game do
    subject {
        Game.new(
            title: "test",
            genre: "test",
            score: 43,
            developer: "test",
        )
    }
  context 'validation test on game title' do
    it 'ensures title presence' do
        subject.title = nil
        expect(subject).to_not be_valid   #   title presence is set to required in 'game.rb'
    end
    it 'ensures title minimum length' do
        subject.title = "a"
        expect(subject).to_not be_valid   #   title length minimum is 3
    end
    it 'ensures title maximum length' do
        subject.title = "a" * 40
        expect(subject).to_not be_valid   #   title length maximum is 40
    end
  end
  context 'validation test on game score' do
    it 'ensures score presence' do
        subject.score = nil
        expect(subject).to_not be_valid   #   score presence is set to required in 'game.rb'
    end
    it 'ensures score presence is in valid number range' do
        subject.score = 101
        expect(subject).to_not be_valid   #   score must be between 1...100
    end
    end
end
