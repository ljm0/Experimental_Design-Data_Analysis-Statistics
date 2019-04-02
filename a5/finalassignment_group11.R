# Read Table
galadata=read.table("gala.txt",header=TRUE)
galadata[1:5,]

#Task 1 step-down method "Species"
summary(lm(Species~Area+Elevation+Nearest+Scruz+Adjacent,data=galadata))
summary(lm(Species~Area+Elevation+Scruz+Adjacent,data=galadata))
summary(lm(Species~Elevation+Scruz+Adjacent,data=galadata))
summary(lm(Species~Elevation+Adjacent,data=galadata))

#Task 2 step-down method for "sqrt(Species)"
summary(lm(sqrt(Species)~Area+Elevation+Nearest+Scruz+Adjacent,data=galadata))
summary(lm(sqrt(Species)~Area+Elevation+Scruz+Adjacent,data=galadata))
summary(lm(sqrt(Species)~Area+Elevation+Adjacent,data=galadata))
summary(lm(sqrt(Species)~Elevation+Adjacent,data=galadata))


#Task 3 
gala_lm = lm(Species~Elevation~Adjacent,data = galadata)
gala_lm2 = lm(sqrt(Species)~Elevation~Adjacent,data = galadata)
plot(fitted(gala_lm),residuals(gala_lm))
plot(fitted(gala_lm2),residuals(gala_lm2))
qqnorm(residuals(gala_lm))
qqnorm(residuals(gala_lm2))


#Task 4 cook test
sqrtlm=lm(sqrt(Species)~Elevation+Adjacent,data=galadata)
round(cooks.distance(sqrtlm),2)
plot(1:30,cooks.distance(sqrtlm))

  # cook's test remove influence point 1
newgala=galadata[-16,]
newsqrtlm=lm(sqrt(Species)~Elevation+Adjacent,data=newgala)
round(cooks.distance(newsqrtlm),2)
plot(1:29,cooks.distance(newsqrtlm))

  # cook's test remove influence point 2
newgala2=galadata[-c(12,16),]
newsqrtlm2=lm(sqrt(Species)~Elevation+Adjacent,data=newgala2)
round(cooks.distance(newsqrtlm2),2);
plot(1:28,cooks.distance(newsqrtlm2))
  # new model summary
summary(newsqrtlm2)

#Task 5
par(mfrow=c(2,3))
for (i in 1:6) hist(gala[,i],main=colnames(gala)[i],xlab="",ylab="")
pairs(gala)
for (i in 1:6) hist(log(gala[,i]),main=colnames(gala)[i],xlab="",ylab="")
pairs(log(gala))


# Task 6 AIC and summary
modlog=lm(log(Species)~log(Area)+log(Elevation)+log(Nearest)+log(Scruz+1)+log(Adjacent),data=galadata)
modlog1=step(modlog)
summary(modlog1)

# Task 8 
round(cooks.distance(modlog1), 2)
plot(cooks.distance(modlog1))
qqnorm(residuals(modlog1))
shapiro.test(residuals(modlog1))
plot(residuals(modlog1), fitted(modlog1))

#Task 9
galadata$logElevation=log(galadata$Elevation)
galadata$logArea=log(galadata$Area)
modlog2=lm(log(Species)~logArea+logElevation+logScruz,data=galadata)
pairs(gala_data)
round(cor(galadata[,7:8]),2)
summary(modlog2)
modlog3 = lm(log(Species)~logArea*logElevation+logScruz)
summary(modlog3)