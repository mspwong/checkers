require "test_helper"

class PieceTest < ActiveSupport::TestCase

  context "move beyond board" do
    should "not validate" do
      assert false
    end
  end

  context "move backward" do
    context "for red team" do
      should "not validate" do
        assert false
      end
    end

    context "for white team" do
      should "not validate" do
        assert false
      end
    end
  end

  context "move sideway on same row" do
    should "not validate" do
      assert false
    end
  end

  context "move to light square" do
    should "not validate" do
      assert false
    end
  end

  context "move forward by more than 1 diagonal" do
    should "not validate" do
      assert false
    end
  end

  context "move to occupied square" do
    should "not validate" do
      assert false
    end
  end

  context "move forward to next dark square on the board that is not occupied" do
    context "for red team" do
      should "validate and move" do
        assert false
      end
    end

    context "for white team" do
      should "validate and move" do
        assert false
      end
    end
  end

end