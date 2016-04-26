HachemRevised <- function(number_of_states, timeline_number, 
Y,W,t, time_to_predict) {

##########  PROGRAM INITIALIZATION  #####
m = number_of_states       # number of rows in each matrix #
n = timeline_number        # number of columns in each matrix #
k = time_to_predict        # prediction horizon #
X = matrix(nrow=12,ncol=2); X[,1] = rep(1,12); X[,2] = t
ivector = seq(from=1,to=m,by=1)
tvector = seq(from=1,to=n,by=1)
WYear = vector(length=n); WTilda = 0; WTotal = 0
WS = vector(length=m); WSTotal = 0
c1 = 0; c2 = 0
b1 = vector(length=m); b2 = vector(length=m)
b1bar = 0; b2bar = 0
b = matrix(nrow=2,ncol=5)
mu = matrix(nrow=5,ncol=12)
XCent = matrix(nrow=12,ncol=2)       # X centered #
SigmaTemp = matrix(nrow=5,ncol=12)
SigmaTemp1 = matrix(nrow=5,ncol=12)
SigmaTemp2 = vector(length=m)
SigmaTemp3 = vector(length=m)
StdError = vector(length=m); SigmaSq = 0
Tau1Temp1 = vector(length=m); Tau2Temp1 = vector(length=m)
Tau1Sq = 0; Tau2Sq = 0; Tau1Sq1 = 0; Tau2Sq1 = 0
k0 = 0; k1 = 0
A11 = vector(length=m); A22 = vector(length=m)
cred = matrix(nrow=2,ncol=2)
sumcred = vector(length=2); sumcredwt = vector(length=2)
halpha = matrix(nrow=2,ncol=5); hbeta = matrix(nrow=2,ncol=5)
paramet = matrix(nrow=2,ncol=5)
cred_prem = matrix(nrow=1,ncol=5)

##########  CENTER OF GRAVITY & RECENTERED X  #####
for (t in tvector) {
WYear[t] = sum(W[,t])
WTilda = WTilda + (WYear[t] * t)
WTotal = WTotal + WYear[t] }    # collective center of gravity W.. #
XCent = as.matrix(cbind(rep(1,12),X[,2] - WTilda/WTotal))   # X at center of gravity #

##########  VOLUME MEASURES & OTHER CONSTANTS  #####
for (i in ivector) {
WS[i] = sum(XCent[,2]^2 * W[i,])
WSTotal = WSTotal + WS[i] }
for(i in ivector) {
c1 = c1 + (sum(W[i,])/WTotal) * (1 - sum(W[i,])/WTotal)
c2 = c2 + (WS[i]/WSTotal) * (1 - WS[i]/WSTotal)
b1[i] = sum(Y[i,] * t(W[i,]))/sum(W[i,])
b2[i] = sum(t(W[i,]) * (Y[i,] - b1[i]) * XCent[,2])/WS[i]
b[1,i] = b1[i]; b[2,i] = b2[i]
b1bar = b1bar + (b1[i] * sum(W[i,])/WTotal)
b2bar = b2bar + (b2[i] * WS[i]/WSTotal)
HachemData = data.frame(Y=Y[i,],X=XCent[,2])
Reg = lm(Y~X, data=HachemData)       # Individual Regression #
mu[i,] = Reg$fitted.values }
c1 = 1/c1 * (m-1)/m; c2 = 1/c2 * (m-1)/m

##########  VARIANCE COMPONENTS  #####
SigmaTemp = Y-mu; SigmaTemp1=(Y-mu)^2
for(i in ivector) {
SigmaTemp2[i] = sum(SigmaTemp1[i,] * t(W[i,]))
SigmaTemp3[i] = sum(SigmaTemp[i,] * t(W[i,]))/sum(W[i,])
StdError[i] = sqrt((SigmaTemp2[i]/sum(W[i,])) - (SigmaTemp3[i])^2) }
SigmaTemp2 = SigmaTemp2/(n-2); SigmaSq = sum(SigmaTemp2)/m
Tau1Temp1 = (b1-b1bar)^2; Tau2Temp1 = (b2-b2bar)^2
for(i in ivector) {
Tau1Sq1 = Tau1Sq1 + sum(W[i,]) * Tau1Temp1[i]
Tau2Sq1 = Tau2Sq1 + WS[i] * Tau2Temp1[i] }
Tau1Sq = (m*c1/WTotal) * ((Tau1Sq1/(m-1)) - SigmaSq)
Tau2Sq = (m*c2/WSTotal) * ((Tau2Sq1/(m-1)) - SigmaSq)
k0 = SigmaSq/Tau1Sq; k1 = SigmaSq/Tau2Sq

##########  PARAMETERS & PREDICTION  #####
for (i in ivector) {
A11[i] = sum(W[i,])/(sum(W[i,])+k0)
A22[i] = WS[i]/(WS[i]+k1)
cred = as.matrix(rbind(c(A11[i],0),c(0,A22[i])))
sumcredwt = sumcredwt + (cred%*%b[,i])
sumcred[1] = sumcred[1] + A11[i]; sumcred[2] = sumcred[2] + A22[i] }
hbeta = sumcredwt/sumcred

for (i in ivector) {
cred = as.matrix(rbind(c(A11[i],0),c(0,A22[i])))
halpha[,i] = cred%*%(b[,i] - hbeta); paramet[,i] = halpha[,i] + hbeta }
cred_prem = t(as.matrix(c(1, k)))%*%paramet

##########  RESULTS  #####
result1=list(collective_center_of_gravity=WTilda/WTotal,X_at_center_of_gravity=XCent)
result2=list(vtilda_double_dot=WSTotal,c1=c1,c2=c2,b1bar=b1bar,b2bar=b2bar)
result3=list(alpha=halpha,beta_plus_alpha=paramet,sigmasq=SigmaTemp2)
result4=list(result1, Volume_Measure_And_Other_Componenets=result2,Structural_Parameters=result3,Prediction=cred_prem,Std._Error=StdError); return(result4)
}


install.packages("actuar")
library(actuar)
fit <- cm(~state, hachemeister, regformula = ~time, regdata = data.frame(time = 1:12), ratios = ratio.1:ratio.12, weights = weight.1:weight.12)
fit
summary(fit, newdata = data.frame(time = 13))

source("HachemRevised.R")
HachemRevised(5,12, hachemeister[,2:13], hachemeister[,14:25], 1:12,13)

