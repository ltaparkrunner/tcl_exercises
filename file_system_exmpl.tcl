;# Собираем имена файлов...

set ail1 [glob /home/alex-m/wrk/myproj/tcl/tcl_exercises/*_exmpl.tcl]
set ail2 [glob /home/alex-m/wrk/myproj/tcl/tcl_exercises/*_exmpl.tcl]

;# Задание формата для вывода списка

set fmt "%-17s %13s %-7s"
puts "[format "$fmt Комментарий" "Папка" "Имя" "Тип"]"

;# Цикл, проходящий по всем значениям, собранным glob
;# Для определения размеров и типов
;# Вывод результатов

foreach name [concat $ail1 $ail2] {  
  ;# Разделение имени на части для вывода:
  set dir [file dirname $name]
  set filename [file tail $name]
  
  ;# Определения типа
  set type [file type $name]

  ;# Вывод полученных результатов
  puts -nonewline "[format $fmt $dir $filename $type]"
  
  ;# В зависимости от типа записи вывод размера (для файла)
  ;# или имени адресуемого файла (для символьной ссылки)

  if {[string match [file type $name] "link"]} {
      puts " указывает на: [file readlink $name]"
     }

  if {[string match [file type $name] "file"]} {
      puts " размер: [file size $name] байт"
     }
  }

