# frozen_string_literal: true

module TransactionsHelper
  module_function

  def recent_locations(transactions, limit = nil)
    transactions.order(date: :desc).limit(limit)
  end

  def average_time(transactions)
    hours = []
    minutes = []

    count = transactions.pluck(:date).each do |date|
      hours << date.hour
      minutes << date.min
    end.count

    average_hour = hours.sum / count
    average_min = minutes.sum / count

    Time.now.change(hour: average_hour, min: average_min)
  end
  
  def unique_locations(transactions)
    transactions.select(:location).distinct
  end
end
