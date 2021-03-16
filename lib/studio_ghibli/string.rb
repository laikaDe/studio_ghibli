class String
    def print_slowly
      self.each_char do |c|
        sleep 0.015
        print c
      end
    end
end

              