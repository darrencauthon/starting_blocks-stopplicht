module StartingBlocks
  module Extensions
    class StopplichtAlert

      def receive_files_to_run files
        @spec_count = files.count
        return if files.count == 0
        display :yellow
      end

      def receive_results results
        return if @spec_count.to_i == 0
        if results[:skips].to_i > 0
          display :yellow
        end
        if results[:errors].to_i > 0
          display :red
        elsif results[:failures].to_i > 0
          display :red
        elsif results[:tests].to_i > 0
          display :green
        else
          display :red
        end
      end

      def display color
        case color
        when :red
        when :green
        when :yellow
        end
      end
    end
  end
end
