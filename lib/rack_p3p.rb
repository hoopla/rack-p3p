require 'fileutils'

# Shamelessly ripped from http://www.mail-archive.com/rubyonrails-core@googlegroups.com/msg09777.html
class P3p

  # 
  # @param app [Object] the Rack app 
  # @param policy [String] the compact P3P policy, without the 'CP=' prefix. If nil, a default policy will be used.
  def initialize(app, policy=nil)
    @app = app
    @policy = policy || self.class.default_policy
  end

  def call(env)
    response = @app.call(env)
    insert_p3p(response)
  end

  # Returns the policy wrapped in the correct syntax
  #
  # @param policy [String] the policy value
  def self.as_policy(policy)
    %Q[CP="#{policy}"]
  end

  # returns a default policy stating that no contact information will be stored
  def self.default_policy
    %q{NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM}
  end

  private
  
  # When the response is a 304, removes cookies from the header
  # Otherwise, adds a header for the configured P3P policy
  def insert_p3p(response)
    if response.first == 304
      response[1].delete('Set-Cookie')
    else
      response[1].update('P3P' => P3p.as_policy(@policy))
    end
    response
  end

end
