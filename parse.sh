#!/bin/bash
sh /home/HomeWorkBash/scriptXip.sh > parse.txt
sh /home/HomeWorkBash//scriptYurl.sh >> parse.txt
sh /home/HomeWorkBash//error.sh >> parse.txt

cat parse.txt
rm parse.txt