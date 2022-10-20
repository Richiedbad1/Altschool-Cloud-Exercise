#! /usr/bin/bash

TIMER=$(date +%H%M)
FILE=/home/vagrant/memory.log
MAIL="badmusrichard95@gmail.com"
# Create a mem log

if [[ -f $FILE ]]; then
        echo "It exist"
        date >> $FILE
        free -h >> $FILE
        echo "--- --- ---" >> $FILE
        echo "           " >> $FILE
else
        touch $FILE
        date >> $FILE
        free -h >> $FILE
        echo "--- --- ---" >> $FILE
        echo "           " >> $FILE
fi

if [[ $TIMER == 0000 ]]; then
        echo "Dear Richie, attached is a log file." | mutt -s "Your Daily Memory Report" -a $FILE -- $MAIL
        rm -r $FILE
fi

