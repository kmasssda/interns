class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :description, presence: true
  validates :user, presence: true
  validates :resolve, presence: true
  scope :solved, -> { where(resolve: true) }
  scope :unsolved, -> { where(resolve: false) }
end
