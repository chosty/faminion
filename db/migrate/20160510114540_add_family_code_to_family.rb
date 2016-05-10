class AddFamilyCodeToFamily < ActiveRecord::Migration
  def change
    add_column :families, :family_code, :string

    add_index :families, :family_code, unique: true
  end
end
