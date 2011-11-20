class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :city
      t.string :main_location
      t.string :second_location
      t.string :map_address
      t.string :country
      t.string :start_date
      t.string :max_numbers
      t.string :more_one_day
      t.string :numbers_source
      t.string :image_url
      t.string :icon_1
      t.string :icon_2
      t.string :icon_3

      t.timestamps
    end
  end
end
