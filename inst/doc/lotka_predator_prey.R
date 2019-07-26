## ---- setseed, echo=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## ------------------------------------------------------------------------
library(GillespieSSA)

## ------------------------------------------------------------------------
parms <- c(c1 = 10, c2 = .01, c3 = 10)
tf <- 2                                        # Final time
simName <- "Lotka predator-prey model"         # Name

## ------------------------------------------------------------------------
x0 <- c(Y1=1000, Y2=1000)

## ------------------------------------------------------------------------
nu <- matrix(c(+1, -1, 0, 0, 1, -1), nrow = 2, byrow = TRUE)

## ------------------------------------------------------------------------
a  <- c("c1*Y1", "c2*Y1*Y2","c3*Y2")

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
  method = ssa.etl(tau = .002),
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
  method = ssa.btl(f = 100),
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
  method = ssa.otl(epsilon = .1),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

