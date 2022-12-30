{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    # import system packages
    ./packages.nix

#     # apps and services I use
#     ./graphical
#     ./terminal
#     ./services
#     ./gaming
#
#     # declarative system and program theme
#     ./themes
  ];
  config = {
    home = {
      stateVersion = "23.05";
      extraOutputsToInstall = ["doc" "devdoc"];
    };
  };

}
