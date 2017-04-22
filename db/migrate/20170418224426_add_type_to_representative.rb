class AddTypeToRepresentative < ActiveRecord::Migration[5.0]
  def change
    add_column :representatives, :type, :string
  end
end
