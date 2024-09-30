class Equipament < ApplicationRecord
  has_many :schedules

  has_rich_text :description

  def self.availables(period_start, period_end)
    period_end ||= Date.new(2099, 12, 31)

    where.not(
      id: left_outer_joins(:schedules)
            .where(
              "(schedules.period_start, schedules.period_end) OVERLAPS (?, ?)",
              period_start,
              period_end
            ).where(schedules: { status: [ "pending", "in_progress" ] })
    )
  end
end
