require 'starting_blocks'
require_relative 'stopplicht_alert'

StartingBlocks::Publisher.subscribers << StartingBlocks::Extensions::StopplichtAlert.new
