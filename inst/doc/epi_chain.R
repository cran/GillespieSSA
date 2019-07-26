## ---- setseed, echo=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(fig.width = 8, fig.height = 6)

## ------------------------------------------------------------------------
library(GillespieSSA)

## ------------------------------------------------------------------------
patchPopSize <- 500                    # Patch size
U <- 20                                # Number of patches
simName <- "SIRS metapopulation model" # Simulation name
tf <- 50                               # Final time

parms <- c(
  beta = 0.001,                        # Transmission rate
  gamma = 0.1,                         # Recovery rate
  rho = 0.005,                         # Loss of immunity rate
  epsilon = 0.01,                      # Proportion inter-patch transmissions
  N = patchPopSize                     # Patch population size (constant)
) 

## ------------------------------------------------------------------------
x0 <- c(patchPopSize - 1, 1, rep(c(patchPopSize, 0), U - 1))
names(x0) <- unlist(lapply(seq_len(U), function(i) paste0(c("S", "I"), i)))

## ------------------------------------------------------------------------
nu <- matrix(c(-1, -1,  0, +1,  # S
               +1, +1, -1,  0), # I
             nrow=2,byrow=TRUE)

## ------------------------------------------------------------------------
a <- unlist(lapply(
  seq_len(U),
  function(patch) {
    i <- patch
    j <- if (patch == 1) U else patch - 1
    
    c(
      paste0("(1-epsilon)*beta*S", i, "*I", i), # Intra-patch infection
      paste0("epsilon*beta*S", i, "*I", j),     # Inter-patch infection
      paste0("gamma*I", i),                     # Recovery from infection
      paste0("rho*(N-S", i, "-I", i, ")")       # Loss of immunity
    )
  }
))

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
ssa.plot(out, by = 5, show.title = TRUE, show.legend = FALSE)

## ----etl-----------------------------------------------------------------
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
ssa.plot(out, by = 5, show.title = TRUE, show.legend = FALSE)

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
ssa.plot(out, by = 5, show.title = TRUE, show.legend = FALSE)

## ----otl-----------------------------------------------------------------
set.seed(1)
out <- ssa(
  x0 = x0,
  a = a,
  nu = nu,
  parms = parms,
  tf = tf,
  method = ssa.otl(hor = rep(2, length(x0))),
  simName = simName,
  verbose = FALSE,
  consoleInterval = 1
) 
ssa.plot(out, by = 5, show.title = TRUE, show.legend = FALSE)

