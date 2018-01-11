#!/usr/bin/env ruby

require_relative 'lib/bot'
require_relative 'lib/action'
require_relative 'lib/formatter'
require_relative 'lib/state/state'
require_relative 'lib/state/player'

def main
  $stdout.sync = true
  Bot.new.run
end

main
