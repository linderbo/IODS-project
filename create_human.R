# Klas Linderbor iods ch 4 data wrangling for ex 5

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
str(gii)

summary(hd)
summary(gii)

#print labels
labels(hd)
#make new ones
newlabhdi <- c("HDI.Rank", "country","HDI","life.exp", "edu.exp","edu.mean", "GNI.pc","GNI-HDI.rank")
#assign new names
colnames(hd) <- newlabhdi
#check them
colnames(hd)


#same for gii
labels(gii)
newlabgii <- c("GII.Rank", "country","GII","mat.mort","ado.BR","parl.rep","sec.ed.F","sec.ed.M","labo.F","labo.M")
colnames(gii) <-newlabgii
colnames(gii)

# assign to gii ratios calculated from gii with mutate.
gii <- mutate(gii, eduratio = sec.ed.F / sec.ed.M, laboratio = labo.F /labo.M)
str(gii)


human <- inner_join(gii,hd)
str(human)
setwd("C:/Users/Klas/Documents/GitHub/IODS-project")

write.table(human, file = "data/human.txt")


# ex 5 starts here
# GNI.pc variable is a character variable with a comma separating the thousands. lets make it numeric
# gsub substitutes all matches, sub would substitute only the first. also we convert to numeric.
gsub(",","",human$GNI.pc) #still as a string without the commas

as.numeric(gsub(",","",human$GNI.pc)) # numeric

human$GNI.pc <- as.numeric(gsub(",","",human$GNI.pc))

# want to keep these, but oh oh i  have differnt names "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F" 
colnames(human)
# the ones i need to keep are ("country","mat.mort","ado.BR","parl.rep" ,"eduratio","laboratio","life.exp","edu.exp","GNI.pc")
keepers <- c("country","mat.mort","ado.BR","parl.rep" ,"eduratio","laboratio","life.exp","edu.exp","GNI.pc")

humankeepers <-select(human, one_of(keepers))
dim(humankeepers)
humannaomit <- (na.omit(humankeepers)) #na.omit removes rows with na:s
dim(humannaomit)
#rows 156-162 contain regions, rest are countries. get rid of them
humanonlycountries <- humannaomit[1:155, ]
dim(humanonlycountries)

#give rownames by "country"
rownames(humanonlycountries) <- humanonlycountries$country

#remove col "country"
finalhuman <- select(humanonlycountries, -"country")
#writeout
write.table(finalhuman, file = "data/human.txt")
