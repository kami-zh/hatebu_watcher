require 'hatebu_watcher/version'

module HatebuWatcher
  autoload :Base,       'hatebu_watcher/base'
  autoload :Parameters, 'hatebu_watcher/parameters'
  autoload :Counter,    'hatebu_watcher/counter'
  autoload :Command,    'hatebu_watcher/command'

  module Observers
    autoload :CounterObserver, 'hatebu_watcher/observers/counter_observer'
  end
end
