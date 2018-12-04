# Hotcorg
Hotcorg works as a watchdog to react cpu temperature change. This gem supports macOS only.

## Installation

Add this line to your application's Gemfile:

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
hotcorg go -g 10 -t 70 80 90 -i 60 -c "echo 'hello'"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hotcorg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hotcorg projectâ€™s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hotcorg/blob/master/CODE_OF_CONDUCT.md).
