class CreatePieces < ActiveRecord::Migration
  def self.up
    create_table :pieces, :force=>true do |p|
      p.references :team, :null=>false
      p.integer :x, :null=>false
      p.integer :y, :null=>false
      p.timestamps :null=>false
    end

  end

  def self.down
    drop_table :pieces
  end
end
