class CreateLearningTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_tag_relations do |t|
      t.references :learning, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
