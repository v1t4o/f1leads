require 'spec_helper'
require 'faraday'
require 'leads'
require 'api_request'

describe 'Api Request' do
    context 'POST' do
        it 'successfully' do
            path_csv = YAML.load_file('./config/path.yml')["path"]
            url = YAML.load_file('./config/apis.yml')["uri"]
            created_json = Leads.create_json(path_csv)
            headers = ['Content-Type' => 'application/json']
            resp = Faraday::Response.new(status: 200, response_body: '{}')
            allow(Faraday).to receive(:post).with(url, created_json, headers).and_return(resp)

            response = ApiRequest.post(url, Leads.create_json(path_csv))

            expect(response.status).to eq 200
        end

        it 'and failed' do
            path_csv = YAML.load_file('./config/path.yml')["path"]
            url = YAML.load_file('./config/apis.yml')["uri"]
            created_json = Leads.create_json(path_csv)
            headers = ['Content-Type' => 'application/json']
            resp = Faraday::Response.new(status: 404, response_body: '')
            allow(Faraday).to receive(:post).with(url, created_json, headers).and_return(resp)

            response = ApiRequest.post(url, Leads.create_json(path_csv))

            expect(response.status).to eq 404
        end
    end
end