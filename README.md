Rack-P3p is rack middleware for inserting P3P headers into apps. This will
allow your application to serve cookies to IE when in an iframe. It will also
pull off the cookie on 304 responses, since IE does not like the cookie then.

From version 0.6.0, allows the policy to be configured by the app stack.

Usage
-----

To use Rack-P3p in rails, do the following. Anything else and we'll assume
you're smart enough to figure it out :-)

Add rack-p3p to your gemfile:

    gem 'rack-p3p', :git => 'git://github.com/jmandala/rack-p3p.git'

Add it to your middleware stack in config/application.rb:

    config.middleware.insert_before ActionDispatch::Session::CookieStore, Rack::P3p
    
Supply a custom policy

    config.middleware.insert_before ActionDispatch::Session::CookieStore, Rack::P3p, 'CUS TOM POL ICY'

Enjoy.

Credits
-------

The code for this middleware was shamelessly ripped from a rubyonrails-core
post from Robert Vogel. Thanks, Rob!
