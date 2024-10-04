class CreateQuestionUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :question_users do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
