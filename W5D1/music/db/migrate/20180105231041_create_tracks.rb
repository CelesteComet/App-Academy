class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :ord, null: false
      t.integer :band_id, null: false
      t.integer :album_id, null: false
      t.string :lyrics, null: false
      t.boolean :regular, default: true, null: false

      t.timestamps
    end
    add_index :tracks, :band_id
    add_index :tracks, :album_id
    add_index :tracks, [:album_id, :ord], unique: true
  end
end
