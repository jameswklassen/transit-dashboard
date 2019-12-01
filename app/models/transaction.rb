# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  
  scope :morning, -> {
    where('extract(hour from date) between 0 and 11')
  }

  scope :afternoon, -> {
    where('extract(hour from date) between 12 and 23')
  }
end
