set x "а б в"
puts "Элемент 2 списка {$x} это: [lindex $x 2]\n"

set y [split 9/30/2001 "/"]
puts "Мы празднуем [lindex $y 1]-й день [lindex $y 0]-го месяца\n"

set i 0;
foreach j $x {
	puts "$j элемент номер $i списка x"
	incr i;
}



set b [list а б {в г д} {е {к л}}]
puts "Создание списка командой list: $b\n"

set b [split "а б {в г д} {е {к л}}"]
puts "Создание списка командой split: $b\n"

set a [concat а б {в г д} {е {к л}}]
puts "Создание списка командой concat: $a\n"

lappend a {ий к лм}			;# Помните: {ий к лм} - один элемент
puts "После команды lappend: $a\n"

set b [linsert $a 3 "1 2 3"]		;# "1 2 3" - один элемент
puts "После linsert в позицию 3: $b\n"

# "АА" и "ББ" два элемента списка.
set b [lreplace $b 3 5 "АА" "ББ"]  
puts "После lreplace замены 3х элементов на 2 элемента в позиции 3: $b\n"




set list [list {Washington 1789} {Adams 1797} {Jefferson 1801} \
               {Madison 1809} {Monroe 1817} {Adams 1825} ]

set x [lsearch $list Washington*];
set y [lsearch $list Madison*];
incr x; incr y -1;		;# Установка промежутка

set subsetlist [lrange $list $x $y]

puts "Между Washington и Madison были следующие президенты:"
foreach item $subsetlist {
	puts "Начинал править в [lindex $item 1]: президент [lindex $item 0] "
}

set x [lsearch $list Madison*]

set srtlist [lsort $list];
set y [lsearch $srtlist Madison*];

puts "\n$x был перед Madison по истории"
puts "$y перед Madison по алфавиту"

