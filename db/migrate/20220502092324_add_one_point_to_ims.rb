class AddOnePointToIms < ActiveRecord::Migration[6.1]
  def change
    add_column :ims, :one_point, :string
  end
end
