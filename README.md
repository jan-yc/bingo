# Randomized bingo cards and number calling

## Situation
A team of friends conducted a Bingo event, but ran into two problems:

1. Many participants reported having cards with almost the same numbers, some of them in the same positions. This led to multiple participants waiting on the same number to call "Bingo".
2. Numbers were randomly drawn using another program, but this was done with replacement, leading to many instances of drawing old numbers and delaying the number-calling.

## Contents
This repository contains two R scripts written to address each of the two problems above:

* **bingo-v2.R**: Contains a function that generates X randomly-generated bingo cards in CSV (Comma Separated Values) format, that can be imported and printed as a table using another program (e.g. Microsoft Word or Excel)
* **bingodraw.R**: Initiates an interactive sequence in the R console that randomly sequences and calls numbers one-by-one without replacement.
