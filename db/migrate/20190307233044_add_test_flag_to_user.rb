class AddTestFlagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :test, :integer
  end
end
