require 'open-uri'

URL = 'https://www.unicode.org/Public/14.0.0/ucd/EastAsianWidth-14.0.0d2.txt'
TYPES = Hash.new

def output_line(curr_start, curr_end, curr_type)
  type_id = TYPES[curr_type] ||= TYPES.keys.length
  if curr_end
    diff = curr_end.to_i(16) - curr_start.to_i(16)
    printf("[%d,%d,%d],", type_id, curr_start.to_i(16), diff)
  else
    printf("[%d,%d],", type_id, curr_start.to_i(16))
  end
end

def output_header(line)
  print line.sub(/^# (EastAsianWidth-.*)$/){ "## #{$1}" }
  print <<~EOB
module Unicode
  module Eaw
  EOB
  print "    DATA=["
end

content = URI.open(URL).read
prev_start = prev_end = prev_type = nil
content.each_line.with_index do |line, n|
  if n == 0
    output_header(line)
  elsif line =~ /^([0-9A-Z]+)(?:\.\.([0-9A-Z]+))?;(\w+)/
    curr_start, curr_end, curr_type = $1, $2, $3
    if curr_type == prev_type &&
       ((prev_end && prev_end.to_i(16) + 1 == curr_start.to_i(16)) ||
        (!prev_end && prev_start.to_i(16) + 1 == curr_start.to_i(16)))
      ## concat this line with previous line
      if curr_end
        prev_end = curr_end
      else
        prev_end = curr_start
      end
    else
      if prev_start
        ## output previous line
        output_line(prev_start, prev_end, prev_type)
      end
      prev_start, prev_end, prev_type = curr_start, curr_end, curr_type
    end
  end
end

## output last line
output_line(prev_start, prev_end, prev_type)
puts "]"
types_str = TYPES.keys.map{|ch| ':'+ch}.join(",")
puts '    TYPES=[' + types_str + ']'
puts <<~EOB
  end
end
EOB

