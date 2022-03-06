# screenrotate

This program was originally written for the Lenovo flex 5. But I am
working on making it compatible with most laptops I come in contact
with.
If your laptop supports `iio-sensor-proxy` automatic rotation should
also work by starting `./autoscreenrotation.sh`.
Otherwise use `./screenrotation.sh` with the arguments `normal`,
`inverted`, `left`, `right`.

The arguments `cycle_left`, `cycle_right` and `swap` respectively
cycle the screen rotation or inverts it.

## Requirements

Please look in `default.nix` under `buildInputs = [ ... ];` which
programs are required. `iio-sensor-proxy` is also needed.

## Usage

Run `./autoscreenrotation.sh`
