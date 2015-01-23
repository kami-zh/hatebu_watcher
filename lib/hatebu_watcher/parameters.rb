require 'uri'

module HatebuWatcher
  class Parameters
    attr_reader :url, :interval

    def initialize(params)
      @url      = params[0]
      @interval = params[1].to_i

      raise ArgumentError unless valid?
    end

    private

    def valid?
      valid_url? && valid_interval?
    end

    def valid_url?
      @url =~ URI::regexp
    end

    def valid_interval?
      @interval > 0
    end
  end
end
