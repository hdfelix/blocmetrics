class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :referer
      t.string :name
      t.string :property_1
      t.string :property_2
      t.date :created_on

      t.timestamps
    end
  end
end
