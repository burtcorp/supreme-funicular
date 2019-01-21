# Supreme Funicular

Live coding ETL interview questions for consultants.

There are a two files of interest: `funicular.rb` and
`funicular_spec.rb`. There is a simple base case implemented that
downloads a report, does some convertions on the data and then pushes
it as series to the store.

There are also a few failing tests. The task for the interviewee is to
make them green, one at a time, starting from the top.

## Installation

Install Bundler and run:

```shell
$ bundle
```

## Tests

Run the tests with:

```shell
$ bundle exec rspec funicular_spec.rb
```
