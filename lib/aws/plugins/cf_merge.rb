##
# CloudFormation Merge.
module Aws
  module Plugins

    # @seahorse.client.option [String] :region (ENV['AWS_REGION'])
    #   The AWS region to connect to.  The region is used to construct
    #   the client endpoint.
    #
    # @seahorse.client.option [String] :endpoint
    #   The HTTP endpoint for this client. Normally you should not need
    #   to configure the `:endpoint` directly.  It is constructed from
    #   the `:region` option.  However, sometime you need to specify
    #   the full endpoint, especially when connecting to test
    #   endpoints.
    #
    class CloudFormationMerge < Seahorse::Client::Plugin

      #option(:region) { ENV['AWS_REGION'] || ENV['AMAZON_REGION'] }
      #option(:endpoint) do |cfg|
        #endpoints = cfg.api.metadata['regional_endpoints']
        #if endpoints && endpoints[cfg.region]
          #endpoints[cfg.region]
        #else
          #"#{cfg.api.metadata['endpoint_prefix']}.#{cfg.region}.amazonaws.com"
        #end
      #end

      #def after_initialize(client)
        #raise Errors::MissingRegionError unless client.config.region
      #end

      def after_initialize(client)
        puts "After Init: %s" % client.inspect
      end

    end
  end
end

