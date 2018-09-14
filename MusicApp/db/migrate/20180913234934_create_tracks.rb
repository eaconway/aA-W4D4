class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null:false
      t.integer :ord, null:false
      t.integer :album_id, null:false
      t.string :track_type, null:false
    end
    add_index :tracks, [:album_id, :title], unique: true
  end
end
