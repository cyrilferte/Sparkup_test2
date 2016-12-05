class AddImportationToContacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :importation, foreign_key: true
  end
end
