# Supreme Funicular

There are two files of interest: `funicular.rb` and
`funicular_spec.rb`. There is a simple base test case implemented that
downloads a report, does some conversions on the data and then pushes
it as a time series to the store.

There are also a few failing tests. The task is to make them green,
one at a time, starting from the top.

We want to see an easy to read solution, with adequate performance and good
software-engineering practices.

## Installation

Clone this repository locally:

```shell
$ git clone git@github.com:burtcorp/supreme-funicular.git
```

Install Ruby, for example using
[Rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/) if
you haven't already.

The Ruby version used in this project is specified in `.ruby-version`,
but any version will likely work.

Install Bundler:

```shell
$ gem install bundler
```

Install the gems:

```shell
$ bundle install
```

## Tests

Run the tests with:

```shell
$ bundle exec rspec funicular_spec.rb
```

## Submission

Create a compressed file with the files `funicular.rb` and
`funicular_spec.rb`. If you are using a UNIX based OS, we have
provided a shortcut. Otherwise, feel free to generate them in any way
you want.

```shell
$ make package
```

Send the file to the contact person at Burt before the deadline, as specified in
the email.
