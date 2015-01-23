module HatebuWatcher
  class Command
    class << self
      def start
        params = Parameters.new(ARGV)

        watcher = Base.new(params.url, params.interval)
        watcher.watch
      end
    end
  end
end
