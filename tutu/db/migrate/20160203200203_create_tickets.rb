class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number
      t.string :seat
      t.belongs_to :train, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :final_station
  end
end
