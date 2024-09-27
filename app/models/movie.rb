class Movie < ApplicationRecord
  validates_presence_of :name, :released_at
  validates_uniqueness_of :name, case_sensitive: false

  validate :_released_at_cannot_be_future

  private
  def _released_at_cannot_be_future
    if self.released_at.to_date > Date.today
      errors.add(:released_at, "can't be future")
    end
  end
end