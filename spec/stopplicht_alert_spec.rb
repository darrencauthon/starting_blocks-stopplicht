require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/starting_blocks-stopplicht'
require 'mocha/setup'

describe 'stopplicht' do

  describe "receiving files to run" do

    it "should display yellow if given files" do
      alert = StartingBlocks::Extensions::StopplichtAlert.new

      alert.expects(:display).with :yellow

      alert.receive_files_to_run ["another.txt"]
    end

    it "should display nothing if given no files" do
      alert = StartingBlocks::Extensions::StopplichtAlert.new

      alert.expects(:display).never

      alert.receive_files_to_run []
        
    end

    it "should not throw an error if display throws" do
      alert = StartingBlocks::Extensions::StopplichtAlert.new

      alert.expects(:display).raises 'k'

      alert.receive_files_to_run ["another.txt"]

      # no error should have occurred
    end
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

    it "should eat any exception from display" do

      StartingBlocks::Extensions::StopplichtAlert
        .any_instance.stubs(:display)

      color = Object.new
      alert = StartingBlocks::Extensions::StopplichtAlert.new

      alert.receive_files_to_run ["test.txt"]

      alert.stubs(:display).raises 'k'
      alert.receive_results( { color: color } )
    end

  end

end
