{ pkgs ? import <nixpkgs> {} }: with pkgs;

stdenv.mkDerivation {
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
    chmod +x $out/bin/toggledisableinput
  '';
}
