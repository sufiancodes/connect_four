require_relative "../lib/connect_four/board"

describe Board do
  it "Has Board Class" do
    board = Board.new
    expect(board).to be_kind_of(Board)
  end
end