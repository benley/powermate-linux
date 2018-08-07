{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation rec {
  name = "just-for-nix-shell";
  buildInputs = [
    (import ./default.nix { pkgs=pkgs; })
    clang
    cppcheck
  ];
}
