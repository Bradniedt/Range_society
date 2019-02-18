class CreateTripLog < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_logs do |t|
      t.string :title
      t.integer :miles
      t.string :description
      t.references :user, foreign_key: true
    end
  end
end
