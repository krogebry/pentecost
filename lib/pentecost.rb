##
# Pentecost root

module Pentecost

  class GearHead
    @compiled
    @deployment_name

    attr_accessor :compiled, :deployment_name

    def compile()
    end

    def save()
      name = self.class.name.split( "::" ).last
      Log.debug( "Name: %s" % name )
      fs_out = File.join( FS_ROOT, "compiled", @deployment_name, "%s.json" % name )
      Log.debug( "FSOut: %s" % fs_out )
      out = File.open( fs_out, "w" )
      out.puts( @compiled.to_json )
      out.close()
    end
  end

  class Compiler
    @json
    @modules

    attr_accessor :json, :modules
    def initialize( json )
      @json = json
      @modules = [ "core", "vpc_service", "vpc_client", "proxy_client", "mongodb_cluster", "cloudrim/application" ]
      load_default_modules()
    end

    def load_default_modules()
      @modules.each do |mod_name|
        fs_mod_file = File.join(FS_ROOT, "modules", "%s.rb" % mod_name)
        if(!File.exists?( fs_mod_file ))
          Log.debug( "FSModFile does not exist: %s" % fs_mod_file )
        else
          require fs_mod_file
        end
      end
    end

    def compile()
      #pp @json
      @json.each do |deployment_name, deployment_config|
        Log.debug( "Deployment: %s" % deployment_name )
        deployment_config.each do |el_name, el_config|
          Log.debug( "El: %s" % el_name )
          mod_name = el_name.split( "::" )[1]
          m = Pentecost::Gear.const_get( mod_name ).new()
          m.deployment_name = deployment_name
          m.compile()
          m.save()
        end
      end
    end
  end

end

require File.join( FS_ROOT, "/lib/aws/plugins/cf_merge.rb" )
require File.join( FS_ROOT, "/lib/pentecost/pre.rb" )

