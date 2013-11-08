##
# VPCService

module Pentecost
  module Gear
    class VPCSubnet
    end

    class VPCService < Pentecost::GearHead
      ## Compile the element
      def compile()
        @compiled = JSON::parse(File.read(File.join( FS_ROOT, "templates", "vpc", "base.json" )))
      end

    end ## VPCService
  end ## Modules
end ## Pentecost
