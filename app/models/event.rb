# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Style/Documentation
class Event < ApplicationRecord
  include EventRepresentations

  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :end_date, timeliness: { on_or_after: :start_date }
  validates :title, presence: true

  scope :filter_by_month, lambda { |month|
    year = Time.zone.now.year

    min_start_date = Time.new(year, month)
    max_end_date = min_start_date.end_of_month

    where(start_date: min_start_date..max_end_date, end_date: min_start_date..max_end_date)
  }
end
# rubocop:enable Style/Documentation
# rubocop:enable Style/FrozenStringLiteralComment
