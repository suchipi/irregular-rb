# Irregular

Regular expressions are very powerful, but their syntax can get large and archaic quickly. Irregular is a simple templating language for regular expressions. It helps you abstract chunks of your regular expressions into methods to help make them more readable.

irregular-rb is based on [irregular-js](https://github.com/suchipi/irregular-js). 

## Usage Example

```ruby
class CatRegexp
  include Irregular

  def cat_names
    names = ['betty', 'joyce', 'franklin', 'peter']
    "(#{names.join '|'})"
  end
end

irregular = CatRegexp.new

# insert results of method calls using backticks
regexp = irregular.compile_regexp(/I love my cat `cat_names`!/i)
p regexp # => /I love my cat (betty|joyce|franklin|peter)!/i

# use your regexp as normal
regexp =~ "I love my cat Joyce!" # => 0
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'irregular'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install irregular
```

## API

### Irregular

A module that provides functionality for compiling Irregular Expressions.
Does nothing on its own; include or extend it into your class/module.

### Irregular.compile_regexp
```
compile_regexp(regexp, options = 0)
compile_regexp(string, options = 0)
```

Method that compiles an irregular expression into a Regexp. (returns Regexp)

#### Parameters

`regexp`

A regular expression to use the source pattern and options of for compilation.

`string`

A string to use as the source pattern for compilation.

`options`

A list or or-ed Regexp options to apply to the resulting Regexp.

If passed with a Regexp object, it will be or-ed against the Regexp's existing options.

## Contributing

Pull requests, bug reports welcome.

This library tries to mirror compilation behavior of irregular-js as much as possible- if you notice behavior you think might be a bug, test if it behaves the same in irregular-js first. If you still think it's a bug, the report should be filed against irregular-js, and then once it is resolved there, a bug report should be filed here.

## Running tests

Tests are written using Rspec. To run:
```
$ bundle install rspec spec
```

## License

MIT
