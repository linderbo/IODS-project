# Klas Linderborg 1.11.2018 iods ex 2 data wrangling scriptlrn14

#import dataset defining separator and the existence of a header
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

#60 variables with 183 observations
str(lrn14)
dim(lrn14)

# Access the dplyr library
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

#rescale Attitude into attitude (sum of 10 questions)
lrn14$attitude <- lrn14$Attitude / 10

# choose a handful of columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

# filter out points 0
learning2014 <- filter(learning2014, Points > 0)

#rename variables according to instructions
colnames(learning2014)
colnames(learning2014)[2] <- "age"
# colnames(learning2014)[3] <- "attitude"
colnames(learning2014)[7] <- "points"
colnames(learning2014)

# didthis: setwd("~/GitHub/IODS-project")
write.table(learning2014, file = "data/learning2014.txt")

testread <- read.table("data/learning2014.txt")
str(testread)
head(testread)
