# screenrotate

This program was originally written for the Lenovo flex 5.
But if your laptop has `iio-sensor-proxy` installed and
supports it, automatic rotation should work on any laptop.

## Requirements

Please look in `default.nix` under `buildInputs = [ ... ];` which
programs are required. `iio-sensor-proxy` is also needed.

## Usage

If your laptop supports `iio-sensor-proxy`, run:

```
./autoscreenrotation.sh
```

if you like to set rotation manually, run these commands:

`./screenrotation.sh` with the arguments `normal`,
`inverted`, `left`, `right`.

The arguments `cycle_left`, `cycle_right` and `swap` respectively
cycle the screen rotation or inverts it.

This is perfect if you can map physical buttons to these commands (like for a Thinkpad X201T)
