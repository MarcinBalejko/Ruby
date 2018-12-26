
from_file, to_file = ARGV


in_file = open(from_file)
indata = in_file.read


out_file = open(to_file, 'w')
out_file.write(indata)


out_file.close
in_file.close

=begin
No way you can make this one line!
    That ; depends ; on ; how ; you ; define ; one ; line ; of ; code.
=end
