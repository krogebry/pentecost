##
# Pre parameter processing module.
#

module Pentecost

  class PreCompiler
  end

  module Pre

    class CloudFormation < PreCompiler

      def execute( params )
        region_name = "us-east-1"
        Aws.config = {
          region: region_name,
          access_key_id:  ENV["AWS_ACCESS_KEY"],
          secret_access_key:  ENV["AWS_SECRET_KEY"]
        }
        cfn = Aws::CloudFormation.new()

        res = cfn.describe_stack_resource({
          stack_name: params["StackName"],
          logical_resource_id: params["LogicalResourceId"]
        })

        return { 
          :parameter_key => params[:name], 
          :parameter_value => res.stack_resource_detail.physical_resource_id 
        }
      end

    end

  end
end

