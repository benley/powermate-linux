{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation rec {
  name = "powermate-linux";

  srcs = ./.;

  buildInputs = [
    libpulseaudio
    pkgconfig
    libnotify
    gdk_pixbuf
  ];

  installPhase = ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    cp powermate $out/bin/powermate
    cp 60-powermate.rules $out/etc/udev/rules.d
  '';
}
