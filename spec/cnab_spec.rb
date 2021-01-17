require_relative "spec_helper"

def app
  CNAB
end

describe CNAB do
  before(:all) do
    @cnab = CNAB.new('public/utils/CNAB.txt')
    @transactions = @cnab.get_all
  end

  it "parse the transaction type in a cnab line" do
    expect(@transactions[0]['type']).to eq(3)
  end

  it "translate transaction types" do
    expect(CNAB.type(@transactions[0]['type'])["description"]).to eq("Financiamento")
    expect(CNAB.type(@transactions[1]['type'])["description"]).to eq("Recebimento Empréstimo")
    expect(CNAB.type(@transactions[18]['type'])["description"]).to eq("Recebimento DOC")
    expect(CNAB.type(6)["description"]).to eq("Vendas")
    expect(CNAB.type(9)["description"]).to eq("Aluguel")
    expect(CNAB.type(1)["description"]).to eq("Débito")
  end

  it "parse transaction date" do
    expect(@transactions[0]['date']).to eq("20190301")
  end

  it "parse transactions value" do
    expect(@transactions[0]['value']).to eq(142)
    expect(@transactions[1]['value']).to eq(132)
    expect(@transactions[19]['value']).to eq(5)
  end

  it "parse transactions cpf" do
    expect(@transactions[0]['cpf']).to eq("09620676017")
    expect(@transactions[20]['cpf']).to eq("84515254073")
  end

  it "parse transactions credit card" do
    expect(@transactions[0]['credit_card']).to eq("4753****3153")
    expect(@transactions[20]['credit_card']).to eq("6777****1313")
  end

  it "parse transactions hour" do
    expect(@transactions[0]['hour']).to eq("153453")
    expect(@transactions[20]['hour']).to eq("172712")
  end

  it "parse transactions store owner" do
    expect(@transactions[0]['store_owner']).to eq("JOÃO MACEDO   ")
    expect(@transactions[20]['store_owner']).to eq("MARCOS PEREIRA")
  end

  it "parse transactions store name" do
    expect(@transactions[0]['store']).to eq("BAR DO JOÃO       ")
    expect(@transactions[20]['store']).to eq("MERCADO DA AVENIDA")
  end
end
