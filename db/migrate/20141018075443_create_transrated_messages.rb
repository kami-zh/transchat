class CreateTransratedMessages < ActiveRecord::Migration
  def change
    create_table :translated_messages do |t|
      t.integer :message_id
      t.string :language
      t.text :content
      t.timestamps
    end
  end
end
