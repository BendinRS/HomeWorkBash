cat access.log | awk -F " " '{print $1  }' | sort | uniq -c > tmp
echo "Count ip > 10"
cat tmp | awk '{
if ($1 > 10) 
print $1 " repeats with ip: " $2
}' 
rm -f tmp