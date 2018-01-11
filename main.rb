#!/usr/bin/env ruby

require_relative 'lib/bot'
require_relative 'lib/action'
require_relative 'lib/formatter'
require_relative 'lib/state/state'
require_relative 'lib/state/player'

def main
  $stdout.sync = true
  bot = Bot.new
  bot.run
end

main
