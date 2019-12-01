# frozen_string_literal: true

module TransactionsHelper
  module_function

  def top_stops(transactions, limit = nil)
    transactions.select(:location, 'COUNT(location)')
                .group(:location)
                .order('COUNT(location) DESC')
                .limit(limit)
  end

  def average_time(transactions)
    hours = []
    minutes = []

    count = transactions.pluck(:date).each do |date|
      hours << date.localtime.hour
      minutes << date.localtime.min
    end.count

    average_hour = hours.sum / count
    average_minute = minutes.sum / count

    Time.now.change(hour: average_hour, min: average_minute)
  end
end
