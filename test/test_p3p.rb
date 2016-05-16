require 'test_helper'

# Tests that a policy can be configured
class P3pPolicyTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::P3p.new(DummyApp.new, sample_policy)
  end

  def test_p3p_response
    get "/"

    headers = last_response.header
    p3p = headers['P3P']
    assert_not_nil p3p

    assert_equal p3p, Rack::P3p.as_policy(sample_policy)
  end

  private


  def sample_policy
    'MY POLICY'
  end
end

# Tests that a default policy is provided
class P3pPolicyDefaultTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::P3p.new(DummyApp.new)
  end

  def test_p3p_response
    get "/"

    p3p = last_response.header['P3P']
    assert_not_nil p3p
    assert_equal p3p, Rack::P3p.as_policy(Rack::P3p.default_policy)
  end

  private
end