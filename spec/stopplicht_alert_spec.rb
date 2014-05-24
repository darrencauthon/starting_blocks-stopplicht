require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/starting_blocks-stopplicht'
require 'mocha/setup'

describe 'stopplicht' do

  describe "receiving test results" do

    it "should display the results color" do
      color = Object.new
      alert = StartingBlocks::Extensions::StopplichtAlert.new
      alert.expects(:display).with color

      alert.receive_results( { color: color } )
    end

  end

end
