class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|

      t.timestamps null: false
    end
  end
end
