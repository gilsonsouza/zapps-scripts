#!/bin/bash
SF=2
ZAPPSDIR=../zapps/build/src
LOGDIR=log_graphs
NUMTHREADS=4
DURATION=90
BUFF=200
MYDIR=$PWD
echo > boxplot.txt

if [ "$1" = "" ]
then
    echo Run: $0 benchmark1 benchmark2 ...
    exit 
fi
cd $ZAPPSDIR
mkdir $LOGDIR
for var in "$@"
do
    ./zapps kits  -b $var --load --truncateLog -q $SF -l $LOGDIR --bufsize $BUFF

#    ./zapps kits  -b $var  --duration $DURATION -q $SF -l $LOGDIR --bufsize $BUFF
    #echo ./zapps kits  -b $1  -t $NUMTHREADS --duration $DURATION -q $SF -l $LOGDIR

    ./zapps logplot -l $LOGDIR > logplot.txt
    gnuplot $MYDIR/plotlog.gp

    echo $var > histogram.txt
    ./zapps loghistogram -t -l $LOGDIR  >> histogram.txt
    gnuplot $MYDIR/histogram.gp
    mv histogram.png hitogram_"$var"`date +%d-%b-%H_%M`.png

    echo $var `./zapps loghistogram -b -l $LOGDIR` >> boxplot.txt
done

gnuplot $MYDIR/boxplot.gp


