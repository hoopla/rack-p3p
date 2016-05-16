Gem::Specification.new do |s|
  s.name      = "rack-p3p"
  s.version   = "0.6.0"
  s.authors   = ["Robert Vogel", "Mat Schaffer", "Trotter Cashion", "Joshua Jacobs"]
  s.date      = %q{2012-03-06}
  s.email     = "josh@mandala-designs.com"
  s.homepage  = "https://github.com/jmandala/rack-p3p"
  s.summary   = "Rack-P3p will insert a custom or default P3P header into your app."
  s.description  = <<-EOS.strip
Rack-P3p is rack middleware for inserting P3P headers into apps. This will
allow your application to serve cookies to IE when in an iframe. It will also
pull off the cookie on 304 responses, since IE does not like the cookie then.

This version allows the policy to be configured by the app stack.
  EOS

  s.files      = Dir['lib/**/*']
  s.add_dependency "rack", ">= 1.0.1"
end
