class AddKindToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :kind, foreign_key: true
  end
end
