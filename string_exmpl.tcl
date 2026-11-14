set string "это проверочная строка"

puts "Здесь [string length $string] символов в \"$string\""

puts "[string index $string 1] - второй символ в \"$string\""

puts "\"[string range $string 5 10]\" - символы между пятым и десятым"



set fullpath "/usr/home/clif/TCL_STUFF/TclTutor/Lsn.17"
set relativepath "CVS/Entries"
set directorypath "/usr/bin/"

set paths [list $fullpath $relativepath $directorypath]

foreach path $paths  {
	set first [string first "/" $path];
	set last [string last "/" $path];

	;# Сообщение о том, абсолютный путь или относительный

	if {$first != 0} {
		puts "$path - это относительный путь"
	} else {
		puts "$path - это абсолютный путь"
	}

  ;# Если "/" не последний символ в $path, выделить последнее слово.
  ;# иначе, удалить последний символ "/", и найти предпоследний "/", и
  ;# выделить последнее слово.

	incr last;
	if {$last != [string length $path]} {
		set name [string range $path $last end];
		puts "Путь - $path, имя файла - $name"
    } else {
		incr last -2;
		set tmp [string range $path 0 $last];
		set last [string last "/" $tmp];
		incr last;
		set name [string range $tmp $last end]
		puts "последняя папка в пути $path, это $name"
	}

  ;# CVS это папка созданная программой CVS

	if {[string match "*CVS*" $path]} {
		puts "$path - это часть системы контроля версий исходного кода CVS"
	}

  ;# Сравнение с буквой "а" для выяснения, большой или маленкий первый символ
	set comparison [string  compare $name "a"]
	if {$comparison >= 0} {
		puts "$name начинается с маленькой буквы\n"
	} else {
		puts "$name начинается с большой буквы\n"
	}
}

