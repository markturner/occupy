class DropTables < ActiveRecord::Migration
  def change
    drop_table :camps
  end
end
