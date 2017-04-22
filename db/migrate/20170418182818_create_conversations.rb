class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :lead, foreign_key: true
      t.references :representative, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
