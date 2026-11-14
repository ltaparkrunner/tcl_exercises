#!/usr/bin/env tclsh

proc swap {varName1 varName2} {
    # Привязываем внешние переменные к локальным именам a и b
    upvar 1 $varName1 a
    upvar 1 $varName2 b

    set temp $a
    set a $b
    set b $temp
}

set x 100
set y 200

# Передаем ИМЕНА переменных (x и y), а не $x и $y
swap x y

puts "x = $x, y = $y" ;# Выведет: x = 200, y = 100

# .tcl — Standard Tcl scripts and libraries.
# .tk — Scripts that primarily use the Tk GUI toolkit (though .tcl is also frequently used for Tcl/Tk apps).
# .tm — Tcl Modules, single-file packages designed for Tcl's module loading mechanism (tcl::tm).
# .exp — Scripts written for Expect, a popular Tcl extension used for automating interactive terminal applications.
# .test — Unit test files written using Tcl's built-in tcltest framework.
