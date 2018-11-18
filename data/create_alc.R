# Klas Linderborg 8.11.2018 iods ex 3 data wrangling script alc
# data can be found here: https://archive.ics.uci.edu/ml/datasets/Student+Performance

# read the math and portugal class questionaire data
math <- read.table("data/student-mat.csv", sep = ";" , header=TRUE)
por <- read.table("data/student-por.csv", sep = ";" , header=TRUE)

# merge by "inner merge", keeps only students who answered both questionnaires.
join_by <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")

math_por <- merge(math, por, by = join_by, suffix = c(".math",".por"))

# We create a new data frame combining answers from both questionnaires.
# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- select(two_columns, 1)[[1]]
  }
}
#combine weekday and weekend alcohol consumption into alc_use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
# new variable high_use is true if alc_use > 2
alc <- mutate(alc, high_use = alc_use > 2)
glimpse(alc)

write.table(alc, file = "data/alc.txt")
