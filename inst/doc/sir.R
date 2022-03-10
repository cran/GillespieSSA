## ---- setseed, echo=FALSE-----------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## -----------------------------------------------------------------------------
library(GillespieSSA)

## -----------------------------------------------------------------------------
parms <- c(beta=.001, gamma=.100)
tf <- 100                                      # Final time
simName <- "Kermack-McKendrick SIR"            # Name

## -----------------------------------------------------------------------------
x0 <- c(S=500, I=1, R=0)

## -----------------------------------------------------------------------------
nu <- matrix(c(-1,0,1,-1,0,1),nrow=3,byrow=TRUE)

## -----------------------------------------------------------------------------
a  <- c("beta*S*I", "gamma*I")

## ----direct-------------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.d(),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

## ----etl----------------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.etl(),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

## ----btl----------------------------------------------------------------------
set.seed(2) # for some reason, this does not work with seed = 1
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.btl(),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

## ----otl----------------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.otl(),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

