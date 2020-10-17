class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :end_date, timeliness: {after: :start_date}
  validates :title, presence: true
end
