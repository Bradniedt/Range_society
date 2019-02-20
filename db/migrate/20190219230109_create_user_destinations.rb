class CreateUserDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_destinations do |t|
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true
    end
  end
end
