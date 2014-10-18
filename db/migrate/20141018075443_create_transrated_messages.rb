class CreateTransratedMessages < ActiveRecord::Migration
  def change
    create_table :transrated_messages do |t|
      t.integer :message_id
      t.string :language
      t.text :content
      t.timestamps
    end
  end
end
