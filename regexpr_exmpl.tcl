set sample "Кто ищет - тот найдёт."

set result [regexp {[а-я]+} $sample match]
puts "Результат на позиции: $result совпало: $match"

set result [regexp {([А-Яа-я]+) +([а-я]+)} $sample match sub1 sub2 ]
puts "Результат: $result совпали: $match 1: $sub1 2: $sub2"

regsub "найдёт" $sample "обретёт" sample2
puts "Новое значение: $sample2"

