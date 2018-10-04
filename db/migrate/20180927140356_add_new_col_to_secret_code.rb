class AddNewColToSecretCode < ActiveRecord::Migration[5.0]
  def change
     add_column :secret_codes, :is_used, :boolean, default: false
  end
end
