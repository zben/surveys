class AddYesCountAndNoCountToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :yes_count, :integer, default: 0
    add_column :questions, :no_count, :integer, default: 0
  end
end
