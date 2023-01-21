# Analysis_with_Bash
**Problem**: Leader team AI xử lý ngôn ngữ tự nhiên NLP có yêu cầu phân tích cơ bản vài file dữ liệu để team NLP có đánh giá sơ bộ trước khi process tiếp. Tuy nhiên với lý do bảo mật file cần được xử lý và thống kê trên server và chưa có cài đặt Python, cần nhờ Data Engineer support

**Yêu cầu**:

- Dữ liệu mẫu: [https://www.gutenberg.org/files/74/74-0.txt] & [http://www.smiffy.de/dbkda-2017/city.csv]
- Phân tích:
    - Book The Adventures of Tom Sawyer
        1. How many chapters has the book?
        2. Count the number of empty lines
        3. How often does the names "Tom" and "Huck" appears in the book?
        4. How often do they appear together in one line?
        5. Go to line 1234 of the file. What ist the third word?
        6. Count the words and lines in the book
        7. Translate all words of the book into lowercase
        8. Count, how often each word in this book appears
        9. Order the result, starting with the word with the highest frequency. Which word is it?
        10. Write all the above steps in one statement (using pipes)
        11. Compare the result with the result from the following book: [http://www.gutenberg.org/files/2701/2701-0.txt](http://www.gutenberg.org/files/2701/2701-0.txt) . At which position do the first book
        specific words appear?
        12. Compare the 20 most frequent words of each book. How many are in common?
    - File city.csv
        1. Create a working copy of your file city.csv (for security reasons)
        2. Exchange in the file all occurences of the Province "Amazonas" in Peru (Code PE)
        with "Province of Amazonas"
        3. Print all cities which have no population given.
        4. Print the line numbers of the cities in Great Britain (Code: GB)
        5. Delete the records 5-12 and 31-34 from city.csv and store the result in city.2.csv
        6. Combine the used commands from the last two tasks and write a bash-script
        (sequence of commands), which delete all british cities from the file city.csv

Kết quả: Gửi lại file [result.sh] cho tất cả các tác vụ trên
