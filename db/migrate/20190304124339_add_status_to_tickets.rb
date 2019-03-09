class AddStatusToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :status, foreign_key: true, default: 1
  end
end
