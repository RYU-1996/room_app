class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :introduction
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
