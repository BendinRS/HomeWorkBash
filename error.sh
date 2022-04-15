#!/bin/bash

cat /home/HomeWorkBash/access.log | awk '{print $9}' | grep -Eo "(3|4|5)[0-9]{2}" | sort | uniq > tmp
cat /home/HomeWorkBash/access.log | awk '{print $4}' | grep -Eo "[0-9]{2}\/[A-Z][a-z]{2}\/[0-9]{4}.*" | sort | awk 'NR == 1{print} END{print}' > tmptime
start="$(cat tmptime | awk 'NR == 1{print}')"
finish="$(cat tmptime | awk 'END{print}')"
echo "error output from ${start} to ${finish}:"
cat tmp
rm -rf tmp
rm -rf tmptime
