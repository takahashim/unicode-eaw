require "unicode/eaw/version"
require "unicode/eaw/data"

module Unicode
  module Eaw
    class Error < StandardError; end

    def width(ch)
      cp = ch[0].ord
      left = 0
      right = DATA.length - 1
      while left <= right
        middle = Integer(left + (right - left) / 2);
        range = DATA[middle]
        if cp < range[1]
          right = middle - 1
          next
        else
          end_n = range[1]
          if range.length == 3
            end_n = range[1] + range[2]
          end
          if cp > end_n
            left = middle + 1
            next
          else
            type = TYPES[range[0]]
            if !type
              raise Error, "Unexpected type: #{range[0]}"
            end
            return type
          end
        end
      end
      return :N
    end

    module_function :width
  end
end
