##
# MongoDBCluster

module Pentecost
  module Gear
    class MongoDBCluster < GearHead
      
      def compile()
        configs = JSON::parse(File.read(File.join( FS_ROOT, "templates", "mongodb", "configs.json" )))
        shards = JSON::parse(File.read(File.join( FS_ROOT, "templates", "mongodb", "shards.json" )))
      end

    end ## MongoDBCluster
  end ## Modules
end ## Pentecost
