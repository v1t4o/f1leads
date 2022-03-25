require 'spec_helper'
require 'json'
require 'leads.rb'

describe 'Insert into system lost leads' do
    it 'and convert csv to json successfully' do
        path_csv = YAML.load_file('./config/path.yml')["path"]
        leads_json = File.read('./spec/support/leads.json')
        count_json_expected = JSON.parse(leads_json).count

        created_json = Leads.create_json(path_csv)
        result = JSON.parse(created_json)
        
        expect(result.count).to eq count_json_expected
    end

    context 'and try to post it' do
        it 'successfully' do
            allow(Leads).to receive(:import_lost_leads).and_return('Import leads data successfully')
            
            result = Leads.import_lost_leads

            expect(result).to eq 'Import leads data successfully'
        end

        it 'and failed' do
            allow(Leads).to receive(:import_lost_leads).and_return('Import leads data failed')

            result = Leads.import_lost_leads

            expect(result).to eq 'Import leads data failed'
        end
    end
end