class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :phone
      t.references :representative, foreign_key: true

      t.timestamps
    end
  end
end
