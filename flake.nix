{
  description = "A small script used to automatically change the various Laptops screen rotation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
        rec {
          defaultPackage = packages.screenrotate;

          packages.screenrotate = with pkgs; stdenv.mkDerivation {
            version = "1.0";
            name = "screenrotation";
            src = ./.;
            buildInputs = [
              libwacom
              xf86_input_wacom
              xorg.xrandr
              iio-sensor-proxy
            ];
            dontBuild = true;
            installPhase = ''
              mkdir -pv $out/bin/
              cp ./screenrotation.sh $out/bin/
              chmod +x $out/bin/screenrotation.sh
              cp ./autoscreenrotation.sh $out/bin/
              chmod +x $out/bin/autoscreenrotation.sh
              cp ./toggleautoscreenrotation.sh $out/bin/
              chmod +x $out/bin/toggleautoscreenrotation.sh
              cp ./toggledisableinput.sh $out/bin/
              chmod +x $out/bin/toggledisableinput.sh

              cp ./enableInput.sh $out/bin/
              chmod +x $out/bin/enableInput.sh
              cp ./disableInput.sh $out/bin/
              chmod +x $out/bin/disableInput.sh
            '';
          };
        }
      );
}
