dogs = read.table("dogs.txt", header=TRUE)
isofl = dogs$isofluorane
haloe = dogs$halothane
cyclo = dogs$cyclopropane

shapiro.test(isofl)
shapiro.test(haloe)
shapiro.test(cyclo)
###############11111##############################
# boxplot(dogs)
# qqnorm(isofl,main="Q-Q Plot isofluorane")
# qqnorm(haloe,main="Q-Q Plot halothane")
# qqnorm(cyclo,main="Q-Q Plot cyclopropane")
###################2222222222222222222######################
# dogs_frame = data.frame(yield=as.vector(as.matrix(dogs)),variety=factor(rep(1:3,each=10)))
# dogsonaov=lm(yield~variety,data=dogs_frame)
# anova(dogsonaov)
# summary(dogsonaov)
# confint(dogsonaov)
# 
# par(mfrow=c(2,2)); for (i in 1:3) qqnorm(dogs[,i])
# par(mfrow=c(1,1)); qqnorm(residuals(dogsonaov))

##############333##############################
dogframe=data.frame(worms=as.vector(as.matrix(dogs)),group=as.factor(rep(1:3,each=10)))
attach(dogframe)
kruskal.test(worms,group)
# 
# dogaov=lm(worms~group)
# anova(dogaov)
# qqnorm(dogaov$residuals, main=)

