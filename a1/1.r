# load(file="assign1.RData") 
m=30
n=30
mu=180
nu=180
sd=10
x=rnorm(m,mu,sd)
y=rnorm(n,nu,sd)
# t.test(x,y,var.equal=TRUE)
# t.test(x,y,var.equal=TRUE)[[3]]

B=1000
p=numeric(B)
for (b in 1:B) {x=rnorm(m,mu,sd)
          y=rnorm(n,nu,sd)
          p[b]=t.test(x,y,var.equal=TRUE)[[3]]}
power=mean(p<0.05)
power
length(p)
length(p[p<0.05])
length(p[p<0.1])
hist(p)