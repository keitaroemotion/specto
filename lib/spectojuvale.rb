class SpectoJuvare

  def self.openurl(url, option)
    url.split(',').each do |u|
      case option
      when GUI
        Launchy.open u
      when CUI
        system "lynx #{u}"
      else
        abort "option invalid"
      end
    end
  end

  def self.enlist(file)
    File.open(file, "r").each_line { |l|
      puts l
    }
  end

  def self.file_to_array(file)
      makefile file
      f = File.open(file, "r")
      arr = f.each_line.to_a
      f.close
      arr
  end

  def self.makefile(file)
    if (File.file?(file) == false)
      f = File.new file, "w"
      f.close
    end
  end

  def self.getFile(category)
    file = "#{$rscroot}/#{category}"
    makefile file
    file
  end

  def self.get_operation()
    op = "#{$rscroot}/list"
    if ARGV.size > 1
      op = "#{$rscroot}/#{ARGV[1]}"
    end
    op
  end

  def self.get_option(arg)
      if arg == GUI
        return GUI
      end
      return CUI
  end

  def self.category(index)
    if ARGV[index] != nil
      return  ARGV[index]
    end
    abort "category required."
  end

end
