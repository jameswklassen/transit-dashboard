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
    @transactions = current_user.transactions.order(id: :asc)
  end

  def show
    @transaction = current_user.transactions.find(params[:id])

    redirect_to(transactions_path) if @transaction.nil?
  end

  def upload
    CSV.foreach(params[:file].path, headers: true, header_converters: ->(h) { h.parameterize.underscore }) do |row|
      transaction_for_row = {
        date: Time.strptime(row['date'], '%m/%d/%Y %I:%M:%S %p'),
        transaction_number: row['transaction_number'],
        transit_agency: row['transit_agency'],
        location: row['location'],
        transaction_type: row['type'],
        service_class: row['service_class'],
        discount: row['discount'],
        amount: row['amount'],
        balance: row['balance']
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
      :user_id
    )
  end
end
