class TransactionsController < ApplicationController

  # GET: /transactions
  get "/transactions" do
    @transactions = Transaction.all
    erb :"/transactions/index.html"
  end

  # POST: /transactions
  post "/transactions" do
    if !params.has_key?('file') || params['file']['type'] != "text/plain"
      redirect '/?error=file_not_valid'
    end

    cnab = CNAB.new(params['file']['tempfile'])

    cnab.get_all.each do |line|
      transaction = Transaction.new
      transaction.t_type = line['type']
      transaction.date = line['date']
      transaction.value = line['value']
      transaction.cpf = line['cpf']
      transaction.credit_card = line['credit_card']
      transaction.hour = line['hour']
      transaction.store_owner = line['store_owner']
      transaction.store = line['store']

      transaction.save
    end

    redirect '/transactions'
  end
end
