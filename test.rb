
# string  = "01234567890123456789"
output = ""
if string.size > 16
  output << string[0..7]
  output << string.chars.last(8).join
else
  output << string
end
while output.size < 16
  output << " "
end
output << " |"
output
