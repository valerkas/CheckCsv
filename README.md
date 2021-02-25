CheckCsv Utility count headers in the first line.

Then row by row it compares columns count using following regular expression '(?:^|,)(?:\"(?:[^\"]+|\"\")*\"|[^,]*)'.

If columns count not equal it shows that line.

While executing progress of current record displayed per thousand  of records that was processed.
