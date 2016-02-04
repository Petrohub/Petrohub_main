class AddDocumentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :document_id, :string
  end
end
