library(RUnit)
source('utility.R')

test.1 <- defineTestSuite("utility",
                          dirs=file.path("tests/"),
                          testFileRegexp="utility_test.R")

test.result <- runTestSuite(test.1)