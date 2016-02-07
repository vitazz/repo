class CreateVagons < ActiveRecord::Migration
  def change
    create_table :vagons do |t|
      t.integer :vagon_type
      t.integer :top_places
      t.integer :bottom_places
      t.timestamps null: false
    end
    add_belongs_to :vagons, :train
  end
end
