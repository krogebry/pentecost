pentecost
=========

Pentecost The Commander.

Helps you manage large chunks of CF templates.

DSL language

Short list:
* Pent::Include: [ "ModuleChunk" ]
* Pent::Exec: "MyCustomModule( 'var1', { 'key': 'val' })"
* Pent::Lookup: {
  "Tagged": { "TagKey", "TagValue" }
}


{
  "Description": "VPN layout for the Prism service.",
  "AWSTemplateFormatVersion": "2010-09-09",
  "Parameters": {
    "Pent::Merge": [ "HQ::ASGParams", "HQ::VPCClient", "HQ::ProxyClient" ]
  },
  "Mappings": {
    "Pent::Merge": [ "HQ::Maps::AMI" ]
  }
  "Resources":{

    "ConfigASG": {
      "Type": "AWS::AutoScaling::AutoScalingGroup",
      "Properties": {
        "Tags": [{ "Key": "DeploymentName", "Value": { "Ref": "DeploymentName" }, "PropagateAtLaunch": "true" }],
        "MinSize": { "Ref": "Min" },
        "MaxSize": { "Ref": "Max" },
        "DesiredCapacity": { "Ref": "DesiredCapacity" },
        "AvailabilityZones": [{ "Ref": "AvailabilityZone" }],
        "VPCZoneIdentifier": [{ "Pent::Lookup[vpc]": { "Name": "primary" }],
        "LoadBalancerNames": [{ "Ref": "ElasticLoadBalancer" }],
        "LaunchConfigurationName": { "Ref": "ServiceLaunchConfig" }
      }
    }

  }
  "Outputs":{
  }
}



        "VPCZoneIdentifier": [{ "Pent::Lookup[vpc]": { "Name": "primary" }],
