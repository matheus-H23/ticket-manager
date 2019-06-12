class AddTitleToKinds < ActiveRecord::Migration[5.2]
  def change
    add_column :kinds, :title, :string
  end
end
