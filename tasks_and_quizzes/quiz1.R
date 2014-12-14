setwd("~/Documents/Archives/Enrichment/Coursera/Data Science Track/Capstone/final/en_US/")

con <- file("en_US.twitter.txt", "r")
twitter <- readLines(con)
close(con)

biostats_mention <- grep("biostats", twitter)
twitter[biostats_mention]

love_mention <- grep("love", twitter)
hate_mention <- grep("hate", twitter)

length(love_mention) / length(hate_mention)

computer_mention <- grep("A computer once beat me at chess, but it was no match for me at kickboxing", twitter)
length(computer_mention)

twitcounts <- nchar(twitter)
tmax <- which.max(twitcounts)
nchar(twitter[tmax])


con <- file("en_US.news.txt", "r")
news <- readLines(con)
close(con)

nmax <- which.max(nchar(news))
nchar(news[nmax])


con <- file("en_US.blogs.txt", "r")
blogs <- readLines(con)
close(con)

bmax <- which.max(nchar(blogs))
nchar(blogs[bmax])