## ---- setseed, echo=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## ------------------------------------------------------------------------
library(GillespieSSA)

## ------------------------------------------------------------------------
parms <- c(b = 2, d = 1, K = 1000)      # Parameters
tf <- 10                                # Final time
simName <- "Logistic growth" 

## ------------------------------------------------------------------------
x0 <- c(N = 500)

## ------------------------------------------------------------------------
nu <- matrix(c(+1, -1),ncol = 2)

## ------------------------------------------------------------------------
a  <- c("b*N", "(d+(b-d)*N/K)*N")

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
  tau = .03,
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
  f = 5,
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

