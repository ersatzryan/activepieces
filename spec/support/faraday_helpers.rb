module FaradayHelpers
  def stub_response(fixture:, status: 200, headers: {"Content-Type" => "application/json"})
    [status, headers, File.read("spec/fixtures/#{fixture}.json")]
  end

  def stub_request(path, response:, method: :get, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      args = [method, File.join(Activepieces::Client::BASE_PATH, path)]
      args << body.to_json if %i[patch post put].include?(method)
      stub.send(*args) { response }
    end
  end
end

RSpec.configure do |config|
  config.include FaradayHelpers
end
