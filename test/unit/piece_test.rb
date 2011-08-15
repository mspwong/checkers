require "test_helper"

class PieceTest < ActiveSupport::TestCase

  should_belong_to :team

  context "game start" do

    should "have 24 pieces" do
      assert_equal 24, Piece.all.size
    end

    ["red", "white"].each do |team_name|
      should "have 12 pieces on #{team_name} team" do
        team = teams(team_name)
        pieces = Piece.find_all_by_team_id(team.id)
        assert_equal 12, pieces.size
      end
    end

    should "have all 24 pieces in the correct start positions" do
      pieces = Piece.all

      [[1,1],[1,3],[1,5],[1,7],[2,2],[2,4],[2,6],[2,8],[3,1],[3,3],[3,5],[3,7]].each do |coordinates|
        assert pieces.any? { |p| p.team_id == teams(:white).id  &&  p.x == coordinates[0]  &&  p.y == coordinates[1] }
      end

      [[6,2],[6,4],[6,6],[6,8],[7,1],[7,3],[7,5],[7,7],[8,2],[8,4],[8,6],[8,8]].each do |coordinates|
        assert pieces.any? { |p| p.team_id == teams(:red).id  &&  p.x == coordinates[0]  &&  p.y == coordinates[1] }
      end
    end
  end



  #context "move beyond board" do
  #  should "not validate" do
  #    assert false
  #  end
  #end
  #
  #context "move backward" do
  #  context "for red team" do
  #    should "not validate" do
  #      assert false
  #    end
  #  end
  #
  #  context "for white team" do
  #    should "not validate" do
  #      assert false
  #    end
  #  end
  #end
  #
  #context "move sideway on same row" do
  #  should "not validate" do
  #    assert false
  #  end
  #end
  #
  #context "move to light square" do
  #  should "not validate" do
  #    assert false
  #  end
  #end
  #
  #context "move forward by more than 1 diagonal" do
  #  should "not validate" do
  #    assert false
  #  end
  #end
  #
  #context "move to occupied square" do
  #  should "not validate" do
  #    assert false
  #  end
  #end
  #
  #context "move forward to next dark square on the board that is not occupied" do
  #  context "for red team" do
  #    should "validate and move" do
  #      assert false
  #    end
  #  end
  #
  #  context "for white team" do
  #    should "validate and move" do
  #      assert false
  #    end
  #  end
  #end

end