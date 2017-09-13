class Klik < ApplicationRecord
  belongs_to :team, counter_cache: true
  validates :session, presence: true
end
