class Team < ApplicationRecord
  has_many :kliks, dependent: :destroy
  default_scope { order('kliks_count DESC') }

  validates :name, presence: true
end
