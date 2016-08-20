#!/bin/bash

touch logrun.log

MYDIR="$(pwd)"
PW='/share/apps/espresso-5.2.1-install/pw.x'
MPI='/share/apps/openmpi-1.6.5-install/bin/mpirun'
LOG="$MYDIR/logrun.log"

cd $MYDIR

for dir in ./*/
do
	dir=${dir%*/}
	cd $dir
	echo "$dir start" >> $LOG
	$MPI -np 16 $PW -i input.in > out.o
	echo "$dir done" >> $LOG
	cd $MYDIR
done

echo -e "Your running in $MYDIR has been finished.\nSincerely,\nKresna" | /bin/mail -s "Done Running $MYDIR" apresiokefin@gmail.com
