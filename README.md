# WebpackIntegration

A small gem for dead simple integration with any static assets compiler.
It allows you to reference any file in a output folder for a compiler (webpack / gulp / grunt) that may have a hash digest in the file name by simple non-changeable filename part.

Example:
    public/webpack/reports_view-bundle-ab530a1.js
    public/webpack/reports_view_styles-bundle-b94f982.js
    public/webpack/common-2a55c40.js
    public/webpack/invoices_view-bundle-e881f50.js
    public/webpack/invoices_view_styles-bundle-0ebe2ec.js


Refer to files in Rails views by:

    <%= javascript_include_tag  webpack_file('reports_view_bundle') %>
    <%= javascript_include_tag  webpack_file('reports_view_styles-bundle') %>


Or anywhere in code by:

    # fuzzy, forgiving matching
    WebpackIntergration.fuzzy_file_for(filename)

    # exact file name without the digest
    WebpackIntergration.file_for(filename)


## Installation

  Add this line to your application's Gemfile:
    gem 'webpack_integration'
    $ bundle


## Usage

    # in config/initializers/webpack_integration.rb
    WebpackIntegration.configure do |config|
      config.public_folder         = 'public'  # default 'public'
      config.folder_in_public      = 'webpack' # default 'webpack'
      config.reset_on_each_request = Rails.env.development?  # default false
    end


## Development
    # run tests
    $ sh/test

## Todo
  - make reloading more efficient, maybe in a background process.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/webpack_integration/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
