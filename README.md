# Chosen for rails asset pipeline

[Chosen](https://github.com/harvesthq/chosen) is a library for making long, unwieldy select boxes more user friendly.

The `chosen-rails` gem integrates the `Chosen` with the Rails asset pipeline.

## Usage

### Install chosen-rails gem

Include `chosen-rails` in Gemefile

```rb
gem 'chosen-rails'
```

Then run `bundle install`

### Include chosen javascript assets

Add to your `app/assets/javascripts/application.js` if use with jQuery

```coffee
//= require chosen-jquery
```

Or with Prototype

```coffee
//= require chosen-prototype
```

### Include chosen stylesheet assets

Add to your `app/assets/stylesheets/application.css`

```scss
*= require chosen
```

### Enable chosen javascript by specific css class

Add to one coffee script file, like `scaffold.js.coffee`

```coffee
$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'
```

Notice: `width` option is required since `Chosen 0.9.15`.

And this file must be included in `application.js`

```coffee
//= require chosen-jquery
//= require scaffold
```

Also add the class to your form field

```erb
<%= f.select :author,
  User.all.map { |u| [u.name, u.id] },
               { include_blank: true },
               { class: 'chosen-select' }
%>
```

If you use simple form as form builder

```erb
<%= f.association :author, 
                  collection: User.all,
                  include_blank: true,
                  input_html: { class: 'chosen-select' }
%>
```

### Deployment

Since version 0.13.0, non-digested assets of `chosen-rails` will simply be copied from digested assets.

## Gem maintenance

Maintain `chosen-rails` gem with `Rake` commands.

Update origin chosen source files.

```bash
rake update-chosen
```

Publish gem.

```bash
rake release
```

## License

use MIT license.
