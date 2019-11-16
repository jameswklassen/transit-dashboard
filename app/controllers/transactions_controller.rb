# frozen_string_literal: true

class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    if Transaction.new(transaction_params).save
      flash[:notice] = 'created'
      redirect_to(transactions_path)
    else
      flash[:error] = 'Error creating transaction.'
    end
  end

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
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
      :balance
    )
  end
end
