##
# CloudRim

module Pentecost
  module Gear
    class CloudRimApplication < GearHead

      def compile()
        stack = JSON::parse(File.read(File.join( FS_ROOT, "templates", "cloudrim", "application.json" )))
        return stack
      end

    end ## CloudRim
  end ## Modules
end ## Pentecost
