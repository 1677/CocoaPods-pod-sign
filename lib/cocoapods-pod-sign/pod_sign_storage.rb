require 'singleton'

class PodSignStorage
  include Singleton

  attr_writer :skip_sign
  attr_writer :configurations

  def skip_sign
    return @skip_sign if defined?(@skip_sign)

    @skip_sign = false
  end

  def configurations
    return @configurations if defined?(@configurations)

    @configurations = {}
  end
end


