alldata = read.table("run.txt")

lemo_before = alldata[which(alldata$drink=="lemo"),"before"]
lemo_after = alldata[which(alldata$drink=="lemo"),"after"]
lemo_difference = lemo_before - lemo_after
energy_before = alldata[which(alldata$drink=="energy"),"before"]
energy_after = alldata[which(alldata$drink=="energy"),"after"]
energy_difference = energy_before - energy_after
mydiff = c(lemo_difference,energy_difference)
alldata$difference = mydiff


#######################44444444444#######################
# diff = data.frame(lemo_diff=lemo_difference,energy_diff=energy_difference)
# # print(diff)
# diff_frame= data.frame(yield=as.vector(as.matrix(diff)),variety=factor(rep(1:2,each=12)))
# diff_frame[1:12,]
# timeonaov= lm(yield~variety,data=diff_frame)
# anova(timeonaov)
# # par(mfrow=c(1,2)); for (i in 1:2) qqnorm(diff[,i])
# par(mfrow=c(1,1)); qqnorm(residuals(timeonaov),main="Q-Q Plot residuals")
##################33333333333333333333333#######################
# print(alldata)
# t.test(lemo_difference,energy_difference)
# 
# shapiro.test(lemo_difference-energy_difference)
# 
# qqnorm(lemo_difference,main="Q-Q Plot softdrink time difference")
# qqnorm(energy_difference,main="Q-Q Plot energy time difference")

# shapiro.test(lemo_before-lemo_after)
# shapiro.test(energy_before-energy_after)

#########################222222##################################
# t.test(lemo_before,lemo_after,paired = TRUE)
# t.test(energy_before,energy_after, paired=TRUE)

# qqnorm(lemo_before,main="Q-Q Plot lemo before")
# qqnorm(lemo_after,main="Q-Q Plot lemo after")
# qqnorm(energy_before,main="Q-Q Plot energy before")
# qqnorm(energy_after,main="Q-Q Plot energy after")

# shapiro.test(lemo_before)
# shapiro.test(lemo_after)
# shapiro.test(energy_before)
# shapiro.test(energy_after)

# cor.test(lemo_before,lemo_after)
# cor.test(energy_before,energy_after)

# cor.test(lemo_before,lemo_after,method="spearman")
# cor.test(energy_before,energy_after,method="spearman")
#############################11111##################################
# par(mfrow=c(1,2))
# plot(lemo_before,lemo_after); abline(0,1)
# plot(energy_before,energy_after); abline(0,1)
# print(alldata)



# qqnorm(lemo_difference,main="Q-Q Plot lemo difference")
# qqnorm(energy_difference,main="Q-Q Plot energy difference")
# hist(lemo_difference)
# hist(energy_difference)


# mean(lemo_before)
# mean(lemo_after)
# mean(lemo_difference)
# mean(energy_before)
# mean(energy_after)
# mean(energy_difference)

# sd(lemo_before)
# sd(lemo_after)
# sd(lemo_difference)
# sd(energy_before)
# sd(energy_after)
# sd(energy_difference)

# boxplot(lemo_before,lemo_after,energy_before,energy_after, names=c("lemo_before","lemo_after","energy_before","energy_after"),col=c('green','red',"green","red"))
# boxplot(lemo_difference,energy_difference,names=c("lemo_difference","energy_difference"))
