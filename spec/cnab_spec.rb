require_relative "spec_helper"

def app
  CNAB
end

describe CNAB do
  before(:all) do
    @transactions = CNAB.read('public/utils/CNAB.txt')
  end

  it "parse the type in a cnab line" do
    expect(@transactions[0].type).to eq(3)
  end
end
