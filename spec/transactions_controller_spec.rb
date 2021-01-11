require_relative "spec_helper"

def app
  TransactionsController
end

describe TransactionsController do
  it "upload a .txt file" do
    file = Rack::Test::UploadedFile.new("public/utils/CNAB.txt", "text/plain")

    post '/transactions', "file" => file
    expect(last_response.status).to eq(200)
  end

  it "upload a non .txt file" do
    file = Rack::Test::UploadedFile.new("config.ru", "application/ruby")

    post '/transactions', "file" => file
    expect(last_response.status).to eq(400)
  end
end
