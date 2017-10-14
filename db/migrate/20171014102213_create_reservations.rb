class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :comment

      t.timestamps
    end
  end
end
