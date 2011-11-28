# Chosen for rails asset pipeline

[Chosen](https://github.com/harvesthq/chosen) is a library for making long, unwieldy select boxes more user friendly.

The `chosen-rails` gem integrates the `Chosen` with the Rails asset pipeline.

## Usage

### Install chosen-rails gem

Include `chosen-rails` in Gemefile

    gem 'chosen-rails'

Then run `bundle install`

### Include chosen javascript assets

Add to your `app/assets/stylesheets/application.js` if use with jQuery

    //= require chosen-jquery

Or with Prototype

    //= require chosen-prototype

### Include chosen stylesheet assets

Add to your `app/assets/stylesheets/application.css`

    *= require chosen

## Gem maintainance

Maintain `chosen-rails` gem with `Rake` commands.

Update origin chosen source files.

    rake update-chosen

Publish gem.

    rake release

## License

use MIT license.
