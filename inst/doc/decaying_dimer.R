## ---- setseed, echo=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## ------------------------------------------------------------------------
library(GillespieSSA)

## ------------------------------------------------------------------------
parms <- c(c1=1.0, c2=0.002, c3=0.5, c4=0.04)
tf <- 10                                       # Final time
simName <- "Decaying-Dimerizing Reaction Set"  # Name

## ------------------------------------------------------------------------
x0 <- c(s1=10000, s2=0, s3=0)

## ------------------------------------------------------------------------
nu <- matrix(c(-1, -2, +2,  0,
                0, +1, -1, -1,
                0,  0,  0, +1),
                nrow=3,byrow=TRUE)

## ------------------------------------------------------------------------
a  <- c("c1*s1", "c2*s1*s1", "c3*s2", "c4*s2")

## ----direct--------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = "D",
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
  method = "ETL",
  tau = 0.003,
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
  method = "BTL",
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
  method = "OTL",
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, show.title = TRUE, show.legend = FALSE)

