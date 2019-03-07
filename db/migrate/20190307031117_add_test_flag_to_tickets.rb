class AddTestFlagToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :test, :integer
  end
end
