class AddFieldsToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee, :integer
    add_column :tickets, :reporter, :integer
  end
end
