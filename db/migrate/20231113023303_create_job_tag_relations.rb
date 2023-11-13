class CreateJobTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :job_tag_relations do |t|
      t.references :job, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
