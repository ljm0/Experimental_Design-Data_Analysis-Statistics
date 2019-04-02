nauseatable=read.table("nauseatable.txt", header = TRUE)
nausea=c(rep(0,sum(nauseatable$Incidence.of.no.nausea)),
         rep(1,sum(nauseatable$Incidence.of.Nausea)))
medicin=c(rep("Chlorpromazine",100),
          rep("Pentobarbital(100mg)",32),
          rep("Pentobarbital(150mg)",48),
          rep("Chlorpromazine", 52),
          rep("Pentobarbital(100mg)",35),
          rep("Pentobarbital(150mg)",37))
nausea.frame=data.frame(nausea,medicin)
# xtabs(~medicin+nausea)

# medicin = factor(medicin)
attach(nausea.frame)
B = 1000
tstar = numeric(B)
for (i in 1:B) {
  treatstar=sample(medicin)
  tstar[i]=chisq.test(xtabs(~treatstar+nausea))[[1]]
}
myt = chisq.test(xtabs(~medicin+nausea))[[1]]
hist(tstar)
pl = sum(tstar<myt)/B
pr = sum(tstar>myt)/B
pnew = chisq.test(xtabs(~medicin+nausea))

print(myt)
print(pl)
print(pr)
print(pnew)
