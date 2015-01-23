require 'ruby-growl'

module HatebuWatcher
  module Observers
    class CounterObserver
      def update(count)
        growl = Growl.new('localhost', 'HatebuWatcher')
        growl.add_notification('changed')
        growl.notify('changed', 'HatebuWatcher', text(count))
      end

      private

      def text(count)
        "Count: #{count} (#{time})"
      end

      def time
        Time.now.strftime('%T')
      end
    end
  end
end
