def clear
	system "cls"
	system "clear"
end
def write_at(fname, at_line, sdat)
  open(fname, 'r+') do |f|
    while (at_line-=1) > 0          # read up to the line you want to write after
      f.readline
    end
    pos = f.pos                     # save your position in the file
    rest = f.read                   # save the rest of the file
    f.seek pos                      # go back to the old position
    f.write sdat			        # write new data & rest of file
  end
end
def write_at_new(fname, at_line, sdat)
  open(fname, 'r+') do |f|
    while (at_line-=1) > 0          # read up to the line you want to write after
      f.readline
    end
    pos = f.pos                     # save your position in the file
    rest = f.read                   # save the rest of the file
    f.seek pos                      # go back to the old position
    f.write sdat + $/ * 29            # write new data & rest of file
  end
end