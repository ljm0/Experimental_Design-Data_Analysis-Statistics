library(multcomp)
library(lme4)
cream = read.table("cream.txt",header=TRUE)
cream$batch = factor(cream$batch)
cream$position = factor(cream$position)
cream$starter = factor(cream$starter)
attach(cream)
acidaov = lm(acidity~starter+batch+position,data=cream)
anova(acidaov)
summary(acidaov)
# 
# attach(cream)
# par(mfrow=c(1,3))
# boxplot(acidity~batch,main="acidity~batch",ylab="aidity", xlab="batch");
# boxplot(acidity~position,main="acidity~position",ylab="aidity", xlab="position");
# boxplot(acidity~starter,main="acidity~starter",ylab="aidity", xlab="starter")
# 
# attach(cream)
# par(mfrow=c(1,2))
# interaction.plot(starter,position,acidity); interaction.plot(position,starter,acidity)
# interaction.plot(starter,batch,acidity); interaction.plot(batch,starter,acidity)

creammult=glht(acidaov,linfct=mcp(starter="Tukey"))
confint(creammult)
# summary(creammult)

