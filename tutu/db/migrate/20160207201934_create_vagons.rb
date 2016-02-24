class CreateVagons < ActiveRecord::Migration
  def change
    create_table :vagons do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :sedentary_seats
      t.belongs_to :train
      t.string :type
      t.timestamps null: false
    end
  end
end
