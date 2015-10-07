#!/bin/bash
SF=2
ZAPPSDIR=../zapps/build/src
LOGDIR=log_graphs
NUMTHREADS=4
DURATION=90
BUFF=200
MYDIR=$PWD

if [ "$1" = "" ]
then
    echo Run: $0 benchmark1 benchmark2 ...
    exit 
fi
cd $ZAPPSDIR
mkdir $LOGDIR
./zapps kits  -b $1 --load --truncateLog -q $SF -l $LOGDIR --bufsize $BUFF

./zapps kits  -b $1  --duration $DURATION -q $SF -l $LOGDIR --bufsize $BUFF
#echo ./zapps kits  -b $1  -t $NUMTHREADS --duration $DURATION -q $SF -l $LOGDIR

./zapps logplot -l $LOGDIR > logplot.txt
gnuplot $MYDIR/plotlog.gp

./zapps loghistogram -t -l $LOGDIR  > histogram.txt
gnuplot $MYDIR/histogram.gp


echo $1 `./zapps loghistogram -b -l $LOGDIR` >> boxplot.txt
