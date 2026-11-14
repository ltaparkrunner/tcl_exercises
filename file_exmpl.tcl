set fileid [open "testfile" w+]

seek $fileid 0 start

puts $fileid "Это тест.\nПросто тест."

seek $fileid 0 start

set chars [gets $fileid line1];
set line2 [gets $fileid];

puts "$chars символов в строке \"$line1\""
puts "Вторая строка в файле: \"$line2\""

seek $fileid 0 start

set buffer [read $fileid];
puts "\nВ файле содержится текст:\n$buffer"
close $fileid

