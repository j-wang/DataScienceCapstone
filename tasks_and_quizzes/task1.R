# Task 1, Data Acquisition and Cleaning
library(magrittr)

samplefile <- function(filename, fraction) {
  system(paste("perl -ne 'print if (rand() < ",
               fraction, ")'", filename), intern=TRUE)
}

tokenize <- function(v) {
  # Add spaces before and after punctuation,
  # remove repeat spaces, and split the strings
  gsub("([^ ])([.?!&])", "\\1 \\2 ", v)   %>%
  gsub(pattern=" +", replacement=" ")     %>%
  strsplit(split=" ")
}

profanity_filter <- function(tv) {
  # Takes a tokenized vector
  bad_words <- paste("([Ff][Uu][Cc][Kk]",
                     "[Dd][Aa][Mm][Nn]",
                     "[Ss$][Hh][Ii][Tt]",
                     "[Aa@][Ss$][Ss$]",
                     "[Aa@][Ss$][Ss$][Hh][Oo][Ll][Ee]",
                     "[Cc][Uu][Nn][Tt]",
                     "[Nn][Ii][Gg][Gg][Ee][Rr])", sep="|")
  
  lapply(tv, function(x) gsub(bad_words, " ", x)) %>%
  lapply(FUN=function(x) x[!x == " "])
}


