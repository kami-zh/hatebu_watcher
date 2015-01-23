module HatebuWatcher
  class Base
    def initialize(url, interval)
      @interval = interval

      @counter = Counter.new(url)
      @counter.add_observer(Observers::CounterObserver.new)
    end

    def watch
      loop do
        puts @counter.reload.count

        sleep @interval
      end
    end
  end
end
