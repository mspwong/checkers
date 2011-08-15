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

  context "move to invalid position" do
    setup do
      @piece = pieces(:white_12)
    end
    should "not get far" do
      assert_raise(ArgumentError) { @piece.move(@piece.x, 3.5) }
      assert_raise(ArgumentError) { @piece.move(3.5, @piece.y) }
      assert_raise(ArgumentError) { @piece.move(3.5, 3.5) }
      assert_raise(ArgumentError) { @piece.move(@piece.x, -1) }
      assert_raise(ArgumentError) { @piece.move(-1, @piece.y) }
      assert_raise(ArgumentError) { @piece.move(0, 1) }
      assert_raise(ArgumentError) { @piece.move("does_not_matter", 1) }
      assert_raise(ArgumentError) { @piece.move(@piece.x, 9) }
      assert_raise(ArgumentError) { @piece.move(@piece.x, 0) }
      assert_raise(ArgumentError) { @piece.move(9, @piece.y) }
      assert_raise(ArgumentError) { @piece.move(0, @piece.y) }
      assert_raise(ArgumentError) { @piece.move(9, 9) }
    end
  end

  #context "move outside of board" do
    #context "horizontally" do
    #  should "not validate" do
    #    assert Piece::VALID_COORDINATES.include? @piece.x
    #    assert Piece::VALID_COORDINATES.include? @piece.y
    #    assert_raise(ActiveRecord::RecordInvalid) { @piece.move(@piece.x, 9) }
    #    assert_equal 1, @piece.errors.size
    #    assert_not_nil @piece.errors.on(:y)
    #    assert_raise(ActiveRecord::RecordInvalid) { @piece.move(@piece.x, 0) }
    #    assert_equal 1, @piece.errors.size
    #    assert_not_nil @piece.errors.on(:y)
    #  end
    #
    #  context "vertically" do
    #    should "not validate" do
    #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(9, @piece.y) }
    #      assert_equal 1, @piece.errors.size
    #      assert_not_nil @piece.errors.on(:x)
    #      assert_raise(ActiveRecord::RecordInvalid) { @piece.move(0, @piece.y) }
    #      assert_equal 1, @piece.errors.size
    #      assert_not_nil @piece.errors.on(:x)
    #    end
    #  end
  #
  #    context "both horizontally and vertically" do
  #      should "not validate" do
  #        assert_raise(ActiveRecord::RecordInvalid) { @piece.move(9, 9) }
  #        assert_equal 2, @piece.errors.size
  #        assert_not_nil @piece.errors.on(:x)
  #        assert_not_nil @piece.errors.on(:y)
  #      end
  #    end
  #  end
  #end
  #end

  #context "move to light square" do
  #  should "not validate" do
  #    piece = pieces(:white_12)
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(4, 4) }
  #  end
  #end
  #
  #context "move adjacent horizontally (side way)" do
  #  should "not validate" do
  #    piece = pieces(:white_12)
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(3, 8) }
  #  end
  #end
  #
  #context "move adjacent vertically (up and down)" do
  #  should "not validate" do
  #    piece = pieces(:white_12)
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(4, 7) }
  #  end
  #end
  #
  #context "move backward" do
  #  context "for red team" do
  #    should "not validate" do
  #      piece = pieces(:red_4)
  #      assert_nothing_raised piece.move(5, 7)
  #      assert_raise(ActiveRecord::RecordInvalid) { piece.move(6, 8) }
  #    end
  #  end
  #
  #  context "for white team" do
  #    should "not validate" do
  #      piece = pieces(:white_12)
  #      assert_nothing_raised piece.move(4, 8)
  #      assert_raise(ActiveRecord::RecordInvalid) { piece.move(3, 7) }
  #    end
  #  end
  #end
  #
  #context "move diagonal forward by more than 1 diagonal" do
  #  should "not validate" do
  #    piece = pieces(:white_12)
  #    assert_raise(ActiveRecord::RecordInvalid) { piece.move(5, 5)}
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