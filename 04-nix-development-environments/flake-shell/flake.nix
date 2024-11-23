{
  description = "Python project development environment flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
    }:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              bat
              (python3.withPackages (
                ps: with ps; [
                  numpy
                  pandas
                ]
              ))
            ];

            shellHook = ''
              bat --decorations never README.md
            '';

            ENV = "DEV";
          };
        }
      );
    };
}
