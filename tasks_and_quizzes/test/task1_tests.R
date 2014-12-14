# Tests for Task 1
test.samplefile <- function() {
  fname <- "../data/en_US/en_US.twitter.txt"
  
  # Read in full dataset
  con <- file(fname, "r")
  twitter <- readLines(con)
  close(con)
  
  # Read in a large sample
  twitsample <- samplefile(fname, .05)
  
  cTwit <- nchar(twitter)
  cSamp <- nchar(twitsample)
  
  checkTrue(abs(sd(cTwit) - sd(cSamp)) < .05 * sd(cTwit), 'SD similar.')
  checkTrue(abs(mean(cTwit) - mean(cSamp)) < .05 * mean(cTwit),
            'Means are similar')
}

test.tokenize <- function() {
  to_token <- c("This is a test.",
                "test&2 now  ",
                "more punct?uation",
                "This! is nice",
                "So ! is this.")
  
  expected <- list(c("This", "is", "a", "test", "."),
                   c("test", "&", "2", "now"),
                   c("more", "punct", "?", "uation"),
                   c("This", "!", "is", "nice"),
                   c("So", "!", "is", "this", "."))
  results <- tokenize(to_token)
  
  checkEquals(results, expected)
}

test.profanity_filter <- function() {
  to_test <- c("Fuck you!", "FUCK this SHIT", "ah $hiT", "Damn you asshole",
               "Fine.", "cunt nigger sunshine shit")
  
  expected <- list(c("you", "!"), c("this"), c("ah"), c("you"),
                   c("Fine", "."), c("sunshine"))
  results <- profanity_filter(tokenize(to_test))
  
  checkEquals(results, expected)
}