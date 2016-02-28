####################Output to eps file################
#set terminal epslatex size 5.0,2.62 color colortext
set terminal postscript eps size 5,10 enhanced color \
    font 'Helvetica,20' linewidth 2
set output 'predictedmouthpressure.eps'

##################### Plot Styling ####################
#Removes all borders
set border 0

#tics face outward from border, don't show ticks on x2 and y2 axes, scale major ticks down to 1/2 normal size
set ytics border nomirror in scale 0.5
set xtics border nomirror in scale 0.75

#Draws a line along the x,y-axes from <=x<= and <=y<=
set arrow from  13,0 to 16.5,0 nohead
set arrow from 12.5,0.1 to 12.5,0.9 nohead

#TODO eat
#Make tics starting at -30<=y<=30 every 10 units and 500<=x<=3000 every 500 units
set ytics 0.2,0.2,0.8 #offset 3.0,0
set xtics 13.5,0.5,16 #offset 3.0,0

#makes sure graph y-axis range is appropriate so tics are displayed appropriately
set yrange [0:1]
set xrange [12.5:17]

set xlabel "Time(s)" #offset 4.0,0,0
set ylabel "Lung Volume (L)"

#Removes legend
unset key

##################### Plot Data ########################

#Sets up ability for two plots.One overlayed on the other
set multiplot layout 3,1

#--------------------- Big Plot 1 ---------------------

#Set fancy linepoint style for graph
set style line 1 lc rgb '#0060ad' lt 1 lw 1 pt 7 pi -15 ps 1.5
set style line 2 lc rgb '#864cc1' lt 1 lw 1 pt 7 pi -15 ps 1.5
set pointintervalbox 2.25

 plot 'pant2.txt' using 1:9 with linespoints ls 1,

 ###################Airflow at the Mouth####################################################

 unset label
 unset arrow
 unset xlabel
 unset ylabel
 unset xtics
 unset ytics

 #tics face outward from border, don't show ticks on x2 and y2 axes, scale major ticks down to 1/2 normal size
 set ytics border nomirror in scale 0.5
 set xtics border nomirror in scale 0.75

 #Draws a line along the x,y-axes from <=x<= and <=y<=
 set arrow from  13,-4.75 to 16.5,-4.75 nohead
 set arrow from 12.5,-4.0 to 12.5,3.75 nohead

 #Make tics starting at -30<=y<=30 every 10 units and 500<=x<=3000 every 500 units
 set ytics -3,1,3 #offset 3.0,0
 set xtics 13.5,0.5,16 #offset 3.0,0

 #makes sure graph y-axis range is appropriate so tics are displayed appropriately
 set yrange [-4.75:4]
 set xrange [12.5:17]

 set xlabel "Time(s)" #offset 4.0,0,0
 set ylabel "Airflow (L/s)"

 plot 'pant2.txt' using 1:3 with linespoints ls 1, 0 ls 0 lt rgb "black",

####################PredictedReal Mouth Pressure Style and Plot#########################################

unset label
unset arrow
unset xlabel
unset ylabel
unset xtics
unset ytics
set key

#tics face outward from border, don't show ticks on x2 and y2 axes, scale major ticks down to 1/2 normal size
set ytics border nomirror in scale 0.5
set xtics border nomirror in scale 0.75

#Draws a line along the x,y-axes from <=x<= and <=y<=
set arrow from  13,-2.75 to 16.5,-2.75 nohead
set arrow from 12.5,-2.25 to 12.5,0.75 nohead

#Make tics starting at -30<=y<=30 every 10 units and 500<=x<=3000 every 500 units
set ytics -2,0.5,0.5 #offset 3.0,0
set xtics 13.5,0.5,16 #offset 3.0,0

#makes sure graph y-axis range is appropriate so tics are displayed appropriately
set yrange [-2.75:0.75]
set xrange [12.5:17]

#Removes legend
#unset key

set xlabel "Time(s)" #offset 4.0,0,0
set ylabel "Mouth Pressure (cmH2O)"

plot 'predictedmouthpressure.dat' using 1:2 title 'Real' with linespoints ls 1, 0 notitle ls 0 lt rgb "black", 'predictedmouthpressure.dat' using 1:3 title 'Predicted' with linespoints ls 2

###################### Reset Terminal Output #########
#releases multiplot
unset multiplot

set out
