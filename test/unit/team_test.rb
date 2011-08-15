require "test_helper"

class TeamTest < ActiveSupport::TestCase

  should_have_many :pieces

  context "game start" do
    should "have 2 teams named 'red' and 'white'" do
      teams = Team.all
      assert_equal 2, teams.size
      assert teams.first.name != teams.last.name
      teams.each do |t|
        assert ["red", "white"].include? t.name
      end
    end
  end
end