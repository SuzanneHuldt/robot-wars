#!/usr/bin/env ruby

require_relative 'lib/bot/bot'
require_relative 'lib/bot/formatter'
require_relative 'lib/bot/state/state'
require_relative 'lib/bot/state/player'
require_relative 'lib/action/action'
require_relative 'lib/action/clock'
require_relative 'lib/action/moves/random_move'
require_relative 'lib/action/moves/generator'
require_relative 'lib/action/moves/cell_checker'
require_relative 'lib/action/moves/birthpattern'


def main
  $stdout.sync = true
  Bot.new.run
end

main
