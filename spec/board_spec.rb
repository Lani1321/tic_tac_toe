require 'spec_helper'
require_relative '../lib/board'

RSpec.describe "TicTacToe-BoardTest", :type => :request do
  describe "Board" do
    let(:board){Board.new}

    describe '#initialize' do
      it 'sets the cells of the board to a 9 element array of " "' do
        board = Board.new
        expect(board.cells).to match_array(Array.new(9, " "))
      end
    end

    describe '#cells' do
      it 'has an attribute cells' do
        expect(board).to respond_to(:cells)

        board.cells = []
        expect(board.cells).to match_array([])
      end
    end
  end

end
