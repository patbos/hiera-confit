class Hiera
  module Backend
    class Confit_backend

      def initialize
            require 'rest-client'
            require 'json'
        debug("Started")
      end

      def debug(msg)
        Hiera.debug("[confit]: #{msg}")
      end

      def lookup(key, scope, order_override, resolution_type)
        debug("lookup key: #{key} scope: #{scope} order_override: #{order_override} resolution_type: #{resolution_type}")

        environment = scope['environment']
        component = scope['module_name']
        debug("key: #{key}")
        debug("environment: #{environment}")
        debug("component: #{component}")
        lookup_key = key[/.*::(.*)/,1]
        if lookup_key.nil?
          lookup_key = key
        end

        debug("lookup_key: #{lookup_key}")
        base_url = Config[:confit][:url]
        debug("url: #{base_url}")

        url = "#{base_url}/api/configuration/#{component}/#{environment}/#{lookup_key}"
        debug("request url: #{url}")

        begin

          response = RestClient.get("#{url}", :accept => :json)
        rescue RestClient::ResourceNotFound
          debug("Got 404")
            return nil
        rescue Exception => e
          Hiera.warn("Error #{e.message}")
          return nil
        end

        data = JSON.parse(response)
        return data['value']

      end

    end
  end
end