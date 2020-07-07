class CreateCreditCardCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_card_charges do |t|
      t.jsonb :records

      t.timestamps
    end
  end
end
