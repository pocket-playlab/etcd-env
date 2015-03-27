etcd-env
========

Runs the wrapped command with envronment variables taken from etcd.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'etcd-env'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install etcd-env

## Usage

    etcd-env <etcd key> <command>

### Environment variables

- `ETCD_HOST`
- `ETCD_PORT`

If `ETCD_HOST` is not specified, the script will assume it is running inside a
docker container and will try to reach the etcd server running on the docker
host.

## Development

You will need etcd installed to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `etcd-env.gemspec`, and then
run `bundle exec rake release` to create a git tag for the version, push git
commits and tags, and push the `.gem` file to [rubygems.org][1].

## Contributing

1. Fork it ( https://github.com/[my-github-username]/etcd-env/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[1]: https://rubygems.org/
