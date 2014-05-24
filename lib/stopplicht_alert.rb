module StartingBlocks
  module Extensions
    class StopplichtAlert

      def receive_files_to_run files
        @spec_count = files.count
        return if files.count == 0
        display :yellow
      end

      def receive_results results
        #return if @spec_count.to_i == 0
        display results[:color]
      end

      def display color
        color = "running" if color == :yellow
        `stopplicht-#{color}`
      end
    end
  end
end
