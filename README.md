# Chosen for rails asset pipeline

[Chosen](https://github.com/harvesthq/chosen) is a library for making long, unwieldy select boxes more user friendly.

The `chosen-rails` gem integrates the `Chosen` with the Rails asset pipeline.

## Usage

### Install chosen-rails gem

Include `chosen-rails` in Gemefile

    gem 'chosen-rails'

Then run `bundle install`

### Include chosen javascript assets

Add to your `app/assets/javascripts/application.js` if use with jQuery

    //= require chosen-jquery

Or with Prototype

    //= require chosen-prototype

### Include chosen stylesheet assets

Add to your `app/assets/stylesheets/application.css`

    *= require chosen

### Enable chosen javascript by specific css class

Add to one coffee script file, like `scaffold.js.coffee`

    $ ->
      # enable chosen js
      $('.chzn-select').chosen
        allow_single_deselect: true
        no_results_text: 'No results matched'


And this file must be included in `application.js`

    //= require chosen-jquery
    //= require scaffold

Also add the class to your form field

    <%= f.select :author,
      User.all.map { |u| [u.name, u.id] },
      { include_blank: true },
      { class: 'chzn-select' }
    %>

If you use simple form as form builder

    <%= f.association :author,
      collection: User.all,
      include_blank: true,
      input_html: { class: 'chzn-select' }
    %>

## Gem maintenance

Maintain `chosen-rails` gem with `Rake` commands.

Update origin chosen source files.

    rake update-chosen

Publish gem.

    rake release

## License

use MIT license.
