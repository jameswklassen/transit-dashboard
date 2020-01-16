# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  
  morning = []
  afternoon = []
  
  0.upto(23) do |hour|
    if (hour + Time.zone_offset('EST') / 3600) % 24 < 12
      morning << hour
    else
      afternoon << hour
    end
  end

  scope :morning, -> {
    where('extract(hour from date) in (?)', morning)
  }
  
  scope :afternoon, -> {
    where('extract(hour from date) in (?)', afternoon)
  }
end
