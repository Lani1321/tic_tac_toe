require 'spec_helper'
require_relative '../lib/player'

RSpec.describe "TicTacToe-PlayerTest", :type => :request do
  
  describe 'Player' do
    describe '#initialize' do
      it "creates a player with a token" do
        player = Player.new("X")
        expect(player.token).to eq("X")
      end
    end
  end
end
