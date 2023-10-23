class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :learnings
  has_many :jobs
  has_many :others

  # validates :nickname, :term, :hobby, :learn_reason, :career_pass, :impressed_app, presence: true
end
