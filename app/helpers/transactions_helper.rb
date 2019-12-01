# frozen_string_literal: true

module TransactionsHelper
  extend self
  
  def average_time(transactions)
    hours, minutes = [], []

    count = transactions.pluck(:date).each do |date| 
      hours << date.localtime.hour
      minutes << date.localtime.min
    end.count

    average_hour = hours.sum / count
    average_minute =  minutes.sum / count

    Time.now.change({ hour: average_hour, min: average_minute })
  end
end
