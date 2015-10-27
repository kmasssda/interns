class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :answer, index: true

      t.timestamps
    end
  end
end
