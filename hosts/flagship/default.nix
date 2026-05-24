{ fernix, ... }: 

fernix.lib.nixos {
  system = "x86_64-linux";
  config = import ./configuration.nix;
  
  home-manager = {
    enable          = true;
    useGlobalPkgs   = true;
    useUserPackages = true;
  };
}
