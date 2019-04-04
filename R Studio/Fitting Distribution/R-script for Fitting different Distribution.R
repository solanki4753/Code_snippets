 
 #input data as d

 #fitting distrubtion for d
  fitW <- fitdist(d, "weibull")
  fitg <- fitdist(d, "gamma")
  fitln <- fitdist(d, "lnorm")
  fitb <- fitdist(d, "beta")
  fitn <- fitdist(d, "norm")

##this gives loglikelyhood AIC BIC and paramteres for distribution
  summary(fitW)
  summary(fitg)
  summary(fitln)
  summary(fitb)
  summary(fitn)

 #for pdf cdf pp qq plots  
  dev.new()
  cdfcomp(list(fitW, fitg, fitln,fitb,fitn), legendtext=c("Weibull", "gamma", "lognormal","beta","nomral"))
 
  dev.new()
  denscomp(list(fitW, fitg, fitln,fitb,fitn), legendtext=c("Weibull", "gamma", "lognormal","beta","nomral"))
  
  dev.new()
  qqcomp(list(fitW, fitg, fitln,fitb,fitn), legendtext=c("Weibull", "gamma", "lognormal","beta","nomral"))
  
  dev.new()
  ppcomp(list(fitW, fitg, fitln,fitb,fitn), legendtext=c("Weibull", "gamma", "lognormal","beta","nomral"))
  
  #comaprision of diiferent tests
  gofstat(list(fitW, fitg, fitln,fitb,fitn), fitnames=c("Weibull", "gamma", "lognormal","beta","nomral"))