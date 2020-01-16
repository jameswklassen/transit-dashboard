# frozen_string_literal: true

class TransactionsController < ApplicationController
  require 'csv'

  def new
    @transaction = Transaction.new
  end

  def create
    if current_user.transactions.create(transaction_params)
      flash[:notice] = 'created'
      redirect_to(transactions_path)
    else
      flash[:error] = 'Error creating transaction.'
    end
  end

  def index
    @transactions = current_user.transactions.where(transaction_type: :transit_pass_payment)
  end

  def show
    @transaction = current_user.transactions.find(params[:id])

    redirect_to(transactions_path) if @transaction.nil?
  end

  def upload
    PP.pp Time.zone

    CSV.foreach(params[:file].path, headers: true, header_converters: ->(h) { h.parameterize.underscore }) do |row|
      transaction_for_row = {
        date: Time.strptime(row['date'], '%m/%d/%Y %I:%M:%S %p'),
        transaction_number: row['transaction_number'],
        transit_agency: row['transit_agency'].parameterize.underscore,
        location: row['location'].parameterize.underscore,
        transaction_type: row['type'].parameterize.underscore,
        service_class: row['service_class'].parameterize.underscore,
        discount: row['discount'],
        amount: row['amount'],
        balance: row['balance'],
        time_zone: time_zone
      }

      if current_user.transactions.create(transaction_for_row)
        flash[:notice] = 'created'
      else
        flash[:error] = 'Error creating transaction.'
      end
    end

    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :date,
      :transaction_number,
      :transit_agency,
      :location,
      :transaction_type,
      :service_class,
      :discount,
      :amount,
      :balance,
      :time_zone,
      :user_id
    )
  end

  def time_zone
    'ET'
  end
end
