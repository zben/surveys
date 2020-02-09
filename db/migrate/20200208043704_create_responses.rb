class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :question
      t.references :user
      t.boolean :answer

      t.timestamps
    end
  end
end
