class AddCompanyReferenceToRepresentative < ActiveRecord::Migration[5.0]
  def change
    add_reference :representatives, :company, index: true
  end
end
