wget https://www.gutenberg.org/files/74/74-0.txt
wget http://www.smiffy.de/dbkda-2017/city.csv
wget http://gutenberg.org/files/2701//2701-0.txt
echo '1. How many chapters has the book?' 
grep 'CHAPTER' 74-0.txt | awk '{print $NF}' | grep -ce 'X\>' -ce 'I\>' -ce 'V\>'
echo -e '\n2. Count the number of empty lines.'
grep -c '^\s*$' 74-0.txt
echo -e '\n3. How often does the name "Tom" and "Huck" appears in the book?'
echo "Tom : $(grep -c 'Tom' 74-0.txt)"
echo "Huck : $(grep -c 'Huck' 74-0.txt)" 
echo -e '\n4. How often do they appear together in one line?'
grep 'Tom' 74-0.txt | grep -c 'Huck'
echo -e '\n5. Go to line 1234 of the file. What is the third word?'
sed -n '1234'p 74-0.txt | awk '{print $3}'
echo -e '\n6. Count the words and lines in the book'
echo "Words : $(wc -wl 74-0.txt | awk '{print $2}')"
echo "Lines : $(wc -wl 74-0.txt | awk '{print $1}')"
echo -e '\n7. Translate all words of the book into lowercase'
awk '{print tolower($0)}' 74-0.txt > 74-0-tolower.txt
echo 'Save to 74-0-tolower.txt'
echo -e '\n8. Count, how often each word in this book appears'
grep -wo '[[:alnum:]]\+' 74-0.txt | sort | uniq -c > count-each-word.txt
echo 'Save to count-each-word.txt'
echo -e '\n9. Order the result, starting with the word with the highest frequency. Which word is it?'
grep -wo '[[:alnum:]]\+' 74-0.txt | sort | uniq -c | sort -rg | head -n 1
echo -e '\n10. Compare the result with the result from the following book  : http://gutenberg.org/files/2701/2701-0.txt . At which position do the first book specific words appear?' 

echo -e '\n11. Compare the 20 most frequent words of each book. How many are in common?'
grep -wo '[[:alnum:]]\+' 74-0.txt | sort | uniq -c | sort -rg | head -n 20 | sort > 74-0-head.txt
grep -wo '[[:alnum:]]\+' 2701-0.txt | sort | uniq -c | sort -rg | head -n 20 | sort > 2701-0-head.txt 
comm -2 74-0-head.txt 2701-0-head.txt | wc -l
rm 74-0-head.txt 2701-0-head.txt
echo -e '\n\n----\n\n'
echo '1. Create a working copy of your file city.csv (for security reasons)'
cp city.csv city-copy.csv
echo 'Save to city-copy.csv'
echo -e '\n2. Exchange in the file all occurences of the Province "Amazonas" in Peru (Code PE) with "Province of Amazonas"'
grep 'PE' city.csv | grep 'Amazonas' 
sed -i 's/PE,Amazonas/PE,Province of Amazonas/g' city.csv
echo "--> $(grep 'PE' city.csv | grep 'Amazonas')"
echo -e '\n3. Print all cities which have no population given'
awk -F ',' '{if ($4=="NULL") print $3}' city.csv | sort -u > city-no-population.txt
echo 'Save to city-no-population.txt'
echo -e '\n4. Print the line numbers of the cities in Great Britain (Code: GB)'
grep -n 'GB' city.csv > line-number-GB.txt
echo 'Save to lines-number-GB.txt'
echo -e '\n5. Delete the records 5-12 and 31-34 from city.csv and store the result in city.2.csv'
sed '5,12d;31,34d' city.csv > city2.csv
echo 'Save to city2.csv'
echo -e '\n6.Combine the used commands from the last two tasks and write a bash-script
(sequence of commands), which delete all british cities from the file city.csv'
sed -i '/GB/d' city.csv > city-del-all-british-city.txt
echo 'Save to city-del-all-british-city.txt'
