# refread [op] [targetfile]

require 'fileutils'
require 'launchy'

command = ARGV[0]
target = ARGV[1]

if ARGV.size < 2
  abort "number of argument is not sufficient"
end

http = "http"

File.open(target, "r").each_line { |line|
  if line.include? http
    line.split(" ").each { |part|
      if part.start_with? http
        Launchy.open part
      end
    }
  end
}



