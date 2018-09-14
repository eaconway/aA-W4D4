class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :band_id, null: false
      t.integer :year, null: false
      t.string :album_type, null:false
    end

    add_index :albums, [:band_id, :title], unique: true
  end
end
