# frozen_string_literal: true

class TransactionsController < ApplicationController
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
    @transactions = current_user.transactions
  end

  def show
    @transaction = current_user.transactions.find(params[:id])

    redirect_to(transactions_path) if @transaction.nil?
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
