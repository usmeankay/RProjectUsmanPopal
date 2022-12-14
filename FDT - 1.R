###### ITC - 255########

#First of all, I will upload the dataset "Iris" from the link. 

DflIris=read.csv(url("https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv"))
DflIris

#Uploaded. Now we move on to choose the numerical variable, and mine will be "petal.width".

#Constructing the FDT. 
summary(DflIris$petal.width)

#Since we cannot directly create an FDT for a numerical variable, we have to categorize it first. 

#Selection:
CatPetal.width=c()

for (u in 1: length(DflIris)) {
  if(DflIris$petal.width[u]<0.5){
    CatPetal.width[u]="short"
  }else if (DflIris$petal.length[u]>=0.7 & DflIris$petal.length[u] < 0.9) {
    CatPetal.width[u]="medium"
  }   else { 
    CatPetal.width[u]= "long"}
  
}

head(CatPetal.width)

#I do have an issue, after I run the "head" function, even though it is defined properly, it comes out as short for all the entries.

Petal.width= cbind(DflIris$petal.width, CatPetal.width)
View(Petal.width)

#We have the categorical value now, so we can make the FDT now. 

AbsFreq = table(Petal.width)
AbsFreq

#Relative frequency. 

RelativeFreq = round(prop.table(AbsFreq), 1)
RelativeFreq

#Cumulative Frequency 

CumulativeFreq = cumsum(RelativeFreq)

#The final table becomes like.. 
FDTpetWidth = rbind(AbsFreq,RelativeFreq,CumulativeFreq)
FDTpetWidth


#Done. 
git config --global user.name "usmeankay"

getwd()
install.packages(dplyr)
