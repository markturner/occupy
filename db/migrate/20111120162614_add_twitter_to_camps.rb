class AddTwitterToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :twitter, :string
  end
end
