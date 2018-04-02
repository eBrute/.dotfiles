#!/usr/bin/gnuplot

#set palette model RGB rgbformulae -7,-5,12 #white-red-blue bright
#set palette model RGB rgbformulae 10,-5,12 #white-red-blue
#set palette model RGB rgbformulae -34,13,34 #red-white-blue
#set palette rgbformulae 22,13,10 #blue-green-red
set palette rgbformulae 33,13,10 #violet-blue-green-orange-red
#set palette rgbformulae -10,-13,-26 #blue-green-red
#set palette rgbformulae -10,-13,-26 #blue-green-red
#set palette defined ( 0 '#000090', 1 '#000fff', 2 '#0090ff', 3 '#0fffee', 4 '#90ff70', 5 '#ffee00', 6 '#ff7000', 7 '#ee0000', 8 '#7f0000') #MatLab
#set palette model RGB rgbformulae  7, 5,15 #default
#set palette defined (0 "white", 0.4 "#F15181", 1 "sea-green")
#set palette defined (0 "white", 0.1 "#FFC7A6", 0.2 "#FF9C9C", 0.5 "#46C180", 0.8 "#2A5CFF", 1 "black")

set border linewidth 1.5
# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

#set style fill noborder
set style fill transparent solid 0.25
set style function filledcurves y1=0
set clip two
