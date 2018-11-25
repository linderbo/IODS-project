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
