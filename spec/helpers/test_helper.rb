require_relative 'login_helper'

module TestHelper
  include LoginHelper

end

RSpec.configure do |config|
  config.include TestHelper, :type => :request
end
