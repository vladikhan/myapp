# README

Based on the book «Ruby on Rails 6 実践ガイド» (Baukis2).
This repository shows what I built below is what I changed and why.

## Overview

This is a Rails 6.1 application that serves as a portfolio piece for Middle-level Rails roles.

## Changes Made

### Step 1: Foundation
- Fixed production host configuration to allow external hosts via environment variable `ALLOWED_HOSTS`.
- Added `.rubocop.yml` with basic Rails and performance cop configuration.
- Applied RuboCop auto-correctable offenses (string literals, etc.) to improve code consistency.
- Added GitHub Actions workflow to run RuboCop on push and pull request.

## Setup Instructions

1. Install Ruby 3.1.4
2. Install bundler: `gem install bundler`
3. Install dependencies: `bundle install`
4. Set up database: `rails db:create db:migrate`
5. Start the server: `rails s`

## Testing

Run the test suite with: `bundle exec rspec`

## Deployment

Set environment variable `ALLOWED_HOSTS` to a comma-separated list of allowed hostnames for production.

## License

MIT
