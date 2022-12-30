{
  inputs,
  self,
  pkgs,
  config,
  ...
}: let
  mpv-unwrapped = pkgs.mpv-unwrapped.overrideAttrs (o: {
    src = pkgs.fetchFromGitHub {
      owner = "mpv-player";
      repo = "mpv";
      rev = "48ad2278c7a1fc2a9f5520371188911ef044b32c";
      sha256 = "sha256-6qbv34ysNQbI/zff6rAnVW4z6yfm2t/XL/PF7D/tjv4=";
    };
  });
in {
  home.packages = with pkgs; [
    # Graphical
    thunderbird
    lutris
    qbittorrent
    bitwarden
    xfce.thunar
    obsidian
    pavucontrol
    ungoogled-chromium
    easyeffects

    firefox
    kate
    # CLI
#     cloneit
    catimg
    duf
    todo
    mpv-unwrapped
    yt-dlp
    hyperfine
    fzf
    file
    unzip
    ripgrep
    rsync
    imagemagick
    bandwhich
    grex
    fd
    xh
    jq
    figlet
    lm_sensors
    bitwarden-cli
    dconf
    gcc
    cmake
    trash-cli
    cached-nix-shell
    ttyper
    docker-compose
    docker-credential-helpers
    xorg.xhost
    mov-cli
    nitch
    imv
    git
  ];
}
