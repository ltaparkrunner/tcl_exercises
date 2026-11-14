array set array1 [list \
{123} {Александр Антуфьев} \
{234} {Борис Бобров} \
{345} {Валерий Воронов} \
{456} {Григорий Горбачев} ]

puts "Array1 содержит [array size array1] элементов\n"

puts "Array1 содержит следующие элементы: \n [array names array1] \n"

puts "Идентификатор номер 123 соответствует элементу: $array1(123)\n"

if {[array exist array1]} {
	puts "array1 - массив"
} else {
	puts "array1 не массив"
}

if {[array exist array2]} {
	puts "array2 - массив"
} else {
	puts "array2 не массив"
}



;#
;# Простой перебор по массиву в цикле foreach
;#

foreach id [array names array1] {
	puts "$array1($id) ячейка с индексом: $id"
}

;#
;# Две процедуры перебора по одному массиву
;#

proc getrec_format1 {arrayVar searchid} {
  global $arrayVar
  upvar $searchid id
  set record [array nextelement $arrayVar $id];
  return "Текущий индекс: $record"
}

proc getrec_format2 {arrayVar searchid} {
  global $arrayVar 
  upvar $searchid id
  set record [array nextelement $arrayVar $id];
  return "Текущий индекс: $record"
}

set searchId [array startsearch array1];

puts ""
set item 0;
while {[array anymore array1 $searchId]} {
	incr item;
	if {[expr $item %2]} {
		set format1 [getrec_format1 array1 searchId]
		puts "Элемент номер: $item перебор 1: $format1"
	} else {
		set format2 [getrec_format2 array1 searchId]
		puts "Элемент номер: $item перебор 2: $format2"
	}
}

