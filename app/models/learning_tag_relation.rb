class LearningTagRelation < ApplicationRecord
  belongs_to :learning
  belongs_to :tag
end
