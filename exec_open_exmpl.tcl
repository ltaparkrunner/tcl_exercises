# Создание уникального имени для файла
set tempFileName "test[pid].tcl"

# Открывает файл и записывает туда программу

set outfl [open $tempFileName w]

puts $outfl {
    set len [gets stdin line]
    if {$len < 5} {exit -1}

    for {set i $len} {$i >= 0} {incr i -1} {
        append l2 [string range $line $i $i]
    }
    puts $l2
    exit 0;
}

# Сбрасывает данные и закрывает файл
flush $outfl
close $outfl

# Запускает подпрограмму из текущей и
# Открывает поток к программе

set io [open "|tclsh $tempFileName" r+]

# посылает строку новой программе
# *Данные должны быть сброшены flush*
puts $io "Эта строка вернётся назад."
flush $io

# Получает ответ
set len [gets $io line]

puts "До инверсии: 'Эта строка вернётся назад.'"
puts "Инвертированная строка: $line"
puts "Строка содержит $len символов"

# Запуск программы с заданной строкой на входе

set invert [exec /usr/bin/tclsh $tempFileName << \
	"А РОЗА УПАЛА НА ЛАПУ АЗОРА"]

# Вывод результата
puts "Инверсия 'А РОЗА УПАЛА НА ЛАПУ АЗОРА' это \n $invert"

# Очистка
file delete $tempFileName

