africa = read.table("africa.txt",header=TRUE)
pairs(africa)
africaglm=glm(miltcoup~oligarchy+pollib+parties+pctvote+popn+size+numelec+numregim
              ,family=poisson,data=africa)
summary(africaglm)
par(mfrow=c(1,3))
plot(fitted(africaglm),residuals(africaglm)
     ,xlab="fitted(africaglm)",ylab="residuals(africaglm)")
plot(log(fitted(africaglm)),residuals(africaglm)
     ,xlab="log(fitted(africaglm))",ylab="residuals(africaglm)")
plot(log(fitted(africaglm)),residuals(africaglm,type="response")
     ,xlab="log(fitted(africaglm))",ylab="residuals(africaglm,type=\"response\")")

africaglm_step=glm(miltcoup~oligarchy+pollib+parties,family=poisson,data=africa)
summary(africaglm_step)

plot(fitted(africaglm_step),residuals(africaglm_step)
     ,xlab="fitted(africaglm_step)",ylab="residuals(africaglm_step)")
plot(log(fitted(africaglm_step)),residuals(africaglm_step)
     ,xlab="log(fitted(africaglm_step))",ylab="residuals(africaglm_step)")
plot(log(fitted(africaglm_step)),residuals(africaglm_step,type="response")
     ,xlab="log(fitted(africaglm_step))",ylab="residuals(africaglm_step,type=\"response\")")

# 
# confint(africaglm)
# coef(africaglm)
# 
# plot(fitted(africaglm),residuals(africaglm))
# plot(log(fitted(africaglm)),residuals(africaglm))
# plot(log(fitted(africaglm)),residuals(africaglm,type="response"))
# 
# # hist(rpois(100,20))
# # par(mfrow=c(2,2))
# # plot(table(rpois(100,1)), type = "h", col = "black", lwd=10,main="rpois(100,lambda=1)")
# # plot(table(rpois(100,4)), type = "h", col = "black", lwd=10,main="rpois(100,lambda=4)")
# # plot(table(rpois(100,10)), type = "h", col = "black", lwd=10,main="rpois(100,lambda=10)")
# # plot(table(rpois(100,20)), type = "h", col = "black", lwd=10,main="rpois(100,lambda=20)")
# # 
# # par(mfrow=c(2,2))
# # plot(table(rpois(10,10)), type = "h", col = "black", lwd=10,main="rpois(10,lambda=10)")
# # plot(table(rpois(50,10)), type = "h", col = "black", lwd=10,main="rpois(50,lambda=10)")
# # plot(table(rpois(100,10)), type = "h", col = "black", lwd=10,main="rpois(100,lambda=10)")
# # plot(table(rpois(1000,10)), type = "h", col = "black", lwd=10,main="rpois(1000,lambda=10)")

