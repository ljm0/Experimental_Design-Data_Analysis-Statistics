library(multcomp)
library(lme4)
cow = read.table("cow.txt",header=TRUE)
cow$id=factor(cow$id)
cow$per=factor(cow$per)
attach(cow)
cowlm=lm(milk~treatment+per+id,data=cow)
anova(cowlm)
summary(cowlm)

# cowlmer=lmer(milk~treatment+order+per+(1|id),data=cow,REML=FALSE)
# summary(cowlmer)
# cowlmer1=lmer(milk~order+per+(1|id),data=cow,REML=FALSE)
# anova(cowlmer1,cowlmer)

attach(cow)
t.test(milk[treatment=="A"],milk[treatment=="B"],paired=TRUE)

