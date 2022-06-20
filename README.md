# Mail

## Requirements

### Ruby 3.1

Install the latest version of Ruby.

### Rails 7

```sh
gem i rails
```

## Installation

### Install Dependencies

```sh
bundle
```

### Create databases and run migrations

```sh
bin/rails db:environment:set RAILS_ENV=development

bin/rails db:create

bin/rails db:migrate

# This is for test environment
rake db:test:prepare
```

### Development database seed for testing

```sh
rake db:seed
```

## Testing

```sh
rspec .
```

