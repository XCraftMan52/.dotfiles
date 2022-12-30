{
  description = "My NixOS configuration with questionable stability";
  # https://github.com/xcraftman52/dotfiles

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = import ./hosts inputs;
  };
  inputs = {

    nix = {
      url = "github:NixOS/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixpkgs variants for different channels
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
