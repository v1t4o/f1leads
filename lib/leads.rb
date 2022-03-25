require 'csv'
require 'yaml'
require 'json'
require './lib/api_request'

class Leads
    def self.create_json(path)
        table_leads = CSV.parse(File.read(path), headers: true)
        json_leads = table_leads.map(&:to_h).to_json
    end

    def self.import_lost_leads
        path_csv = YAML.load_file('./config/path.yml')["path"]
        url = YAML.load_file('./config/apis.yml')["uri"]

        response = ApiRequest.post(url, create_json(path_csv))
        
        if response.status == 200
            return 'Import leads data successfully'
        else
            return 'Import leads data failed'
        end
    end
end