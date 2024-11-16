{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
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
}
