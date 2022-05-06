class CreateIms < ActiveRecord::Migration[6.1]
  def change
    create_table :ims do |t|
      t.string :real_name
      t.string :career
      t.string :pastime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
