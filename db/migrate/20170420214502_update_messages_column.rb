class UpdateMessagesColumn < ActiveRecord::Migration[5.0]
  def change
    remove_reference :messages, :representatives
    add_reference :messages, :representative, index: true
  end
end
