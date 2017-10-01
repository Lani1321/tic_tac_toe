require 'spec_helper'
require_relative '../lib/player'

RSpec.describe "TicTacToe-PlayerTest", :type => :request do
  
  describe 'Player' do
    describe '#initialize' do
      it "creates a player with a marker" do
        player = Player.new("X")
        expect(player.marker).to eq("X")
      end
    end
  end
end
