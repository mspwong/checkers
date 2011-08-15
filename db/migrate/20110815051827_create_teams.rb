class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams, :force=>true do |t|
      t.string "name", :null=>false
      t.timestamps :null=>false
    end
    add_index :teams, [:name], :unique=>true
  end

  def self.down
    remove_index :teams, :name
    drop_table :teams
  end
end