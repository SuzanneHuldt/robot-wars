#!/usr/bin/env ruby

require 'require_all'
require_all 'lib'


def main
  $stdout.sync = true
  Bot.new.run
end

main
