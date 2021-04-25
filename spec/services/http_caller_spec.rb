require 'rails_helper'

RSpec.describe HttpCaller do
  let(:endpoint) { 'endpoint' }
  let(:params) { { param_1: 'hello'} }
  let(:token) { { token: 'token'} }

  let(:service) { described_class.new endpoint: endpoint, params: params, token: token }

  delegate :run!, to: :service

  def successful_body
    {
      body: [
        {
          "id": 1,
          "title": "delectus aut autem"
        },
      ]
    }
  end


  describe "#run!" do
    context "Basic request" do

      before(:each) { allow_any_instance_of(HttpCaller).to receive(:run!).and_return(successful_body) }

      context "and service is successful" do
        before(:each) do
          stub_request(:get, endpoint).to_return(body: successful_body.to_json)
          run!
        end
        
        it { expect(service.message).to be_blank }
        it { expect(service.successful?).to be_truthy }
      end
    end
  end

end
