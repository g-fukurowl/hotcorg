# Hotcorg
Hotcorg works as a watchdog to react cpu temperature change. This gem supports macOS only.
https://github.com/g-fukurowl/hotcorg

## Installation

```
$ gem install hotcorg
```


## Usage

Run the following command to start watching a cpu temperature change (Enter Ctrl-C to stop).

```
hotcorg go
```

### Options

```
  -g, [--granularity=N]            # Granularity for change in CPU temperature at which hotcorg should react [°C]
                                   # Default: 1
  -t, [--threthold=one two three]  
                                   # Default: [50, 60, 70, 80, 90]
  -i, [--interval=N]               # Interval when hotcorg checks CPU temperature change [Sec.]
                                   # Default: 5
  -c, [--command=COMMAND]          # Command to be executed each time hotcorg detects CPU temperature change
  -n, [--notify], [--no-notify]    # Whether hotcorg notifies CPU temperature change (supported only with macOS)
                                   # Default: true
```

#### Examples

```
$ hotcorg go -g 10 -t 70 80 90 -i 60 -c "echo 'hello'"
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


