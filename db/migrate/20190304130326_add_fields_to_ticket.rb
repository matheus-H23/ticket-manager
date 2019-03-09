class AddFieldsToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee_id, :integer, default: 1
    add_column :tickets, :reporter_id, :integer
  end
end
