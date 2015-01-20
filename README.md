# Better Dash CLI

[Dash for Mac](http://kapeli.com/dash) is great, but its Terminal integration syntax is
awkward. For example, to look up Ruby's `to_json` method, you'd have to remember this format:

    $ dash://ruby:to_json

But I'd rather just do this:

    $ dash ruby to_json

## Requirements

  - [Dash for Mac](http://kapeli.com/dash)
  - [Ruby](https://www.ruby-lang.org/)

## Installation

    $ git clone git@github.com:zacwasielewski/better-dash-cli.git
    $ cd ./better-dash-cli
    $ rake install

## Usage

Search within a specific language or framework:

    $ dash ruby to_json

Search within *all* installed languages:

    $ dash to_json

## Contributing

1. Fork it ( https://github.com/zacwasielewski/better_dash_cli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
