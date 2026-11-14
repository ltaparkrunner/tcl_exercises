set upper "ЭТО СТРОКА ИЗ ЗАГЛАВНЫХ БУКВ"
set lower "это строка из прописных букв"
set trailer "В конце этой строки точки...."
set leader "....В начале этой строки точки"
set both  "(((Эта строка в скобках)))"

puts "tolower преобразовал : $upper"
puts "            в строку : [string tolower $upper]\n"
puts "toupper преобразовал : $lower"
puts "            в строку : [string toupper $lower]\n"
puts "trimright преобразовал : $trailer"
puts "              в строку : [string trimright $trailer .]\n"
puts "trimleft преобразовал : $leader"
puts "             в строку : [string trimleft $leader .]\n"
puts "trim преобразовал : $both"
puts "         в строку : [string trim $both "()"]\n"

set labels [format "%-20s %+10s " "Товар" "Цена"]
set price1 [format "%-20s %10d рублей килограмм" "Помидоры" "30"]
set price2 [format "%-20s %10d рублей килограмм" "Перец" "20"]
set price3 [format "%-20s %10d рублей килограмм" "Огурцы" "10"]
set price4 [format "%-20s %10.2f рублей за пакет" "Семечки" "4.49997"]

puts "\n Пример форматирования:\n"
puts "$labels"
puts "$price1"
puts "$price2"
puts "$price3"
puts "$price4"
