require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/starting_blocks-stopplicht'
require 'mocha/setup'

describe 'stopplicht' do

  before do
  end

  describe "receiving test results" do

    it "should display the results color" do

      StartingBlocks::Extensions::StopplichtAlert
        .any_instance.stubs(:display)

      color = Object.new
      alert = StartingBlocks::Extensions::StopplichtAlert.new

      alert.receive_files_to_run ["test.txt"]

      alert.expects(:display).with color
      alert.receive_results( { color: color } )
    end

    it "should not display any results if no files were passed" do
      alert = StartingBlocks::Extensions::StopplichtAlert.new
      alert.receive_files_to_run []
      alert.expects(:display).never
      alert.receive_results( { color: Object.new } )
    end

  end

end
