{
  description = "ttyper - terminal typer (fork by SimonRenblad)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };

    ttyper = pkgs.rustPlatform.buildRustPackage {
      pname = "ttyper";
      version = "1.6.1";
      src = ./.;
      cargoLock = {
        lockFile = ./Cargo.lock;
        outputHashes = {
          "ratatui-0.30.0-beta.0" = "sha256-1SVrPoD7l+07HcvdpeSYbe3TZK4nTOHe2dwyx3nLrFE=";
        };
      };
    };
  in {
    packages.x86_64-linux.default = ttyper;
  };
}
