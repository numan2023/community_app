class Tag < ApplicationRecord
  has_many :learning_tag_relations
  has_many :learnings, through: :learning_tag_relations
  has_many :job_tag_relations
  has_many :jobs, through: :job_tag_relations
  validates :tag_name,  uniqueness: true
end
