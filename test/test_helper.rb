require "rack/test"
require "test/unit"
require '../lib/rack_p3p'


class DummyApp
  def call(env)
    [200, {}, ["Hello World"]]
  end
end
