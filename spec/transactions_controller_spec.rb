require_relative "spec_helper"

def app
  TransactionsController
end

describe TransactionsController do
  it "upload a .txt file" do
    file = Rack::Test::UploadedFile.new("public/utils/CNAB.txt", "text/plain")

    post '/transactions', "file" => file

    expect(last_response.location.include?('/transactions')).to be true
  end

  it "upload a non .txt file" do
    file = Rack::Test::UploadedFile.new("config.ru", "application/ruby")

    post '/transactions', "file" => file

    redirect_params = Rack::Utils.parse_query(URI.parse(last_response.location).query)
    expect(redirect_params).to eq("error" => "file_not_valid")
  end
end
