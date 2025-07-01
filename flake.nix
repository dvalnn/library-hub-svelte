{
  description = "Go Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # wails dependencies
            gtk3
            webkitgtk_6_0
            nodejs_22
            wails

            go
            gopls
            svelte-language-server
            jujutsu

            sqlite # (for sqlite3 client)
            # wails optional dependencies
            upx
            nsis
          ];
        };
      }
    );
}
