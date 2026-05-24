{ 
  description = "NixOS configuration";

  inputs = {
    fernix.url = "github:casheeeewnuts/fernix";
  };

  outputs = { fernix, ... }: fernix.build 
  {
    hosts.path   = ./hosts;
    hosts.flagship.enable = true;

    modules.path = ./modules;

    additionalArgs = {};
  };
}
