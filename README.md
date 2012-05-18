# Bootstrap Assets

Bootstrap is Twitter's toolkit for kickstarting CSS for websites, apps, and more. It includes base CSS styles for typography, forms, buttons, tables, grids, navigation, alerts, and more. http://twitter.github.com/bootstrap

Bootstap Assets integrates Bootstrap toolkit for Rails 3.1 Asset Pipeline. Bootstap Assets downloads stylesheets and javascript files from Bootstrap github repository into vendor/assets folder and generates files to load Bootstrap in application.

Sponsored by [Evil Martians].
[Evil Martians]: http://evilmartians.com/

## Installing Gem

Include Bootstrap in Gemfile:

```ruby
group :development do
  gem "bootstrap-assets"
end
```

## Installing to Rails application

You can run following generator to get started with Twitter Bootstrap.

Install:

    rails g bootstrap_assets:install

It should download all slim and js files to vendor/assets folder.


## Using stylesheets

You have to require Bootstrap (bootstrap.css.less) in your application.css

```css
/*
 *= require 'twitter/bootstrap'
 */
```

## Using Javascripts

You have to require Bootstrap JS (bootstrap.js) in your application.js to include all plugins

```js
//= require twitter/bootstrap
```

You may add Javascripts plugins individually

```js
//= require twitter/bootstrap/bootstrap-alert
```


## License

Copyright (c) 2012 Andrey Deryabin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.