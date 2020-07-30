
#Packages Installed
install.packages("tidyverse")
install.packages("here")
#Packages Loaded
library(tidyverse)
library(here)

#Gives the Directory location 
here()

#TAM installation
install.packages("TAM")

#Reading CVS file to R(data -> AI-DataTrain.csv)
D <- read.csv("AI-DataTrain.csv")
#enable to see few columns and rows
str(D)
#Allows to view the whole exported file 
View(D)

#Loading TAM package
library(TAM)

#Performing the manipulation using TAM package
X <- tam(D)
#Summaries the whole manipulation done
summary(X)
diffic <- X$xsi       #Storing the generated output in diffic variable

#Modifying the output by renaming and removing the standard error column
colnames(diffic,do.NULL = FALSE)
colnames(diffic) <- c("Difficulty","x")
df=subset(diffic,select = -c(x))
View(df)

#installing and uploading the xlsx package
install.packages("xlsx")
library("xlsx")
#wiritng the output datafarame from R to xlsx file(Output.Xlsx)
write.xlsx2(df, file="output.xlsx", sheetName = "result", append = FALSE)

#Graph plotting for better visualization
plot(X)        #visualize the probability of a respondent getting the item correct given their ability level(Plot1)
#Gives point plotting for Final output generated(Plot2)
plot(diffic$Difficulty, main="Scatter Plot of Question Difficulties", xlab="Question Number", ylab = "Difficulty in Logits", pch=9)
axis(side=1, at = c(1:50))

#Gives the item value with maximum difficulty
max(diffic$Difficulty)

#Gives item value with minimum difficulty
min(diffic$Difficulty)


