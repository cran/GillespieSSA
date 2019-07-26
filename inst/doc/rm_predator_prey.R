## ---- setseed, echo=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## ------------------------------------------------------------------------
library(GillespieSSA)

## ------------------------------------------------------------------------
parms <- c(b=2, d=1, K=1000, alpha=0.005, 
           w=0.0025, c=2, g=2)
tf <- 10                                               # Final time
simName <- "Rosenzweig-MacArthur predator-prey model"  # Name

## ------------------------------------------------------------------------
x0  <- c(N=500, P=500)

## ------------------------------------------------------------------------
nu  <- matrix(c(+1, -1, -1,  0,  0,
                 0,  0,  0, +1, -1),     
                 nrow=2,byrow=TRUE) 

## ------------------------------------------------------------------------
a <- c(
  "b*N",
  "(d+(b-d)*N/K)*N",
  "alpha/(1+w*N)*N*P",
  "c*alpha/(1+w*N)*N*P",
  "g*P"
) 

## ----direct--------------------------------------------------------------
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

## ----etl-----------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.etl(tau = .01),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

## ----btl-----------------------------------------------------------------
set.seed(1)
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

## ----otl-----------------------------------------------------------------
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

