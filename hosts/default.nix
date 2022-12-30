{
  nixpkgs,
  self,
  ...
}: let
  inputs = self.inputs;
  core = ../modules/core;
  hmModule = inputs.home-manager.nixosModules.home-manager; # home-manager
  shared = [core];
  home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      extraSpecialArgs = {
        inherit inputs;
        inherit self;
      };
    users.xcraftman52 = ../home/xcraftman52;
  };
in {
     prometheus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "prometheus";}
        ./prometheus
        hmModule
        {inherit home-manager;}
      ]
      ++ shared;
     specialArgs = {inherit inputs;};
  };
}
