% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ssa.R
\name{ssa}
\alias{ssa}
\title{Invoking the stochastic simulation algorithm}
\usage{
ssa(
                   x0,            # initial state vector
                    a,            # propensity vector
                   nu,            # state-change matrix
                parms = NULL,     # model parameters
                   tf,            # final time
               method = ssa.d(),  # SSA method
              simName = "",
                  tau = 0.3,      # deprecated
                    f = 10,       # deprecated
              epsilon = 0.03,     # deprecated
                   nc = 10,       # deprecated
                  hor = NA_real_, # deprecated
                  dtf = 10,       # deprecated
                   nd = 100,      # deprecated
  ignoreNegativeState = TRUE,
      consoleInterval = 0,
       censusInterval = 0,
              verbose = FALSE,
          maxWallTime = Inf
)
}
\arguments{
\item{x0}{numerical vector of initial states where the component elements
must be named using the same notation as the corresponding state variable in
the propensity vector, \code{a}.}

\item{a}{character vector of propensity functions where state variables
correspond to the names of the elements in \code{x0}.}

\item{nu}{numerical matrix of change if the number of individuals in each
state (rows) caused by a single reaction of any given type (columns).}

\item{parms}{named vector of model parameters.}

\item{tf}{final time.}

\item{method}{an SSA method,
the valid options are:
\itemize{
\item \code{\link[=ssa.d]{ssa.d()}} --- Direct method (default method),
\item \code{\link[=ssa.etl]{ssa.etl()}} - Explicit tau-leap,
\item \code{\link[=ssa.btl]{ssa.btl()}} --- Binomial tau-leap, or
\item \code{\link[=ssa.otl]{ssa.otl()}} --- Optimized tau-leap.
}}

\item{simName}{optional text string providing an arbitrary name/label for
the simulation.}

\item{tau}{[DEPRECATED], see \code{\link[=ssa.etl]{ssa.etl()}}}

\item{f}{[DEPRECATED], see \code{\link[=ssa.btl]{ssa.btl()}}}

\item{epsilon}{[DEPRECATED], see \code{\link[=ssa.otl]{ssa.otl()}}}

\item{nc}{[DEPRECATED], see \code{\link[=ssa.otl]{ssa.otl()}}}

\item{hor}{[DEPRECATED], see \code{\link[=ssa.otl]{ssa.otl()}}}

\item{dtf}{[DEPRECATED], see \code{\link[=ssa.otl]{ssa.otl()}}}

\item{nd}{[DEPRECATED], see \code{\link[=ssa.otl]{ssa.otl()}}}

\item{ignoreNegativeState}{boolean object indicating if negative state
values should be ignored (this can occur in the \code{etl} method).
If \code{ignoreNegativeState=TRUE} the simulation finishes gracefully when
encountering a negative population size (i.e. does not throw an error).
If \code{ignoreNegativeState=FALSE} the simulation stops with an error
message when encountering a negative population size.}

\item{consoleInterval}{(approximate) interval at which \code{ssa} produces
simulation status output on the console (assumes \code{verbose=TRUE}).
If \code{consoleInterval=0} console output is generated each time step (or
tau-leap). If \code{consoleInterval=Inf} no console output is generated.
Note, \code{verbose=FALSE} disables all console output. \strong{Console
output drastically slows down simulations.}}

\item{censusInterval}{(approximate) interval between recording the state of the system.
If \code{censusInterval=0} \eqn{(t,x)} is recorded at each time step (or
tau-leap). If \code{censusInterval=Inf} only \eqn{(t_0,x_0)}{(t0,x0)}
and \eqn{(t_f,x_t)}{(tf,xf)} is recorded. Note, the size of the time
step (or tau-leaps) ultimately limits the interval between subsequent
recordings of the system state since the state of the system cannot be
recorded at a finer time interval the size of the time steps (or tau-leaps).}

\item{verbose}{boolean object indicating if the status of the simulation
simulation should be displayed on the console. If \code{verbose=TRUE}
the elapsed wall time and \eqn{(t,x)} is displayed on the console every
\code{consoleInterval} time step and a brief summary is displayed at
the end of the simulation. If \code{verbose=FALSE} the simulation runs
\emph{entirely} silent (overriding \code{consoleInterval}).
\strong{Verbose runs drastically slows down simulations.}}

\item{maxWallTime}{maximum wall time duration (in seconds) that the
simulation is allowed to run for before terminated. This option is
useful, in particular, for systems that can end up growing uncontrolably.}
}
\value{
Returns a list object with the following elements,
\itemize{
\item \code{data}: a numerical matrix object of the simulation time series where the first column is the time vector and subsequent columns are the state frequencies.
\item \code{stats}: sub-list object with elements containing various simulation statistics. The of the sub-list are:
\item \code{stats$startWallTime}: start wall clock time (YYYY-mm-dd HH:MM:SS).
\item \code{stats$endWallTime}: end wall clock time (YYYY-mm-dd HH:MM:SS).
\item \code{stats$elapsedWallTime}: elapsed wall time in seconds.
\item \code{stats$terminationStatus}: string vector listing the reason(s) for the
termination of the realization in 'plain words'. The possible termination statuses are:
\itemize{
\item \code{finalTime} = if the simulation reached the maximum simulation time \code{tf},
\item \code{extinction} = if the population size of all states is zero,
\item \code{negativeState} = if one or several states have a negative population size (can occur in the ETL method),
\item \code{zeroProp} = if all the states have a zero propensity function,
\item \code{maxWallTime} = if the maximum wall time has been reached. Note the termination status may have more than one message.
}
\item `stats$nSteps`` total number of time steps (or tau-leaps) executed.
\item \code{stats$meanStepSize}: mean step (or tau-leap) size.
\item \code{stats$sdStepSize}: one standard deviation of the step (or tau-leap) size.
\item \code{stats$SuspendedTauLeaps}: number of steps performed using the Direct method due to \code{OTL} suspension (only applicable for the \code{OTL} method).
\item \code{arg$...}: sub-list with elements containing all the arguments and their values used to invoke \code{ssa} (see Usage and Arguments list above).
}
}
\description{
Main interface function to the implemented \acronym{SSA} methods. Runs a
single realization of a predefined system.
}
\details{
Although \code{ssa} can be invoked by only specifying the system
arguments (initial state vector \code{x0}, propensity vector \code{a},
state-change matrix \code{nu}), the final time (\code{tf}), and the
\acronym{SSA} method to use, substantial improvements in speed and accuracy
can be obtained by adjusting the additional (and optional) \code{ssa}
arguments. By default \code{ssa} (tries to) use conservative default values
for the these arguments, prioritizing computational accuracy over
computational speed. These default values are, however, \strong{not} fool
proof for the approximate methods, and occasionally one will have to hand
tweak them in order for a stochastic model to run appropriately.
}
\note{
Selecting the appropriate \acronym{SSA} method is a trade-off between
computational speed, accuracy of the results, and which \acronym{SSA}
actually works for a given scenario. This depends on the characteristics of
the defined system (e.g. number of reaction channels, number of species, and
the absolute and relative magnitude of the propensity functions).
\strong{Not all methods are appropriate for all models.} When selecting a
\acronym{SSA} method all of these factors have to be taken into
consideration. The various tau-leap methods accept a number of additional
arguments. While the default values of these arguments may work for some
scenarios they may have to be adjusted for others. The default values for
the tau-leap methods are conservative in terms of computational speed and
substantial increase in efficiency may be gained by optimizing their values
for a specific system.
}
\section{Preparing a run}{
 In order to invoke \acronym{SSA} the stochastic
model needs at least four components, the initial state vector (\code{x0}),
state-change matrix (\code{nu}), propensity vector (\code{a}), and the final
time of the simulation (\code{tf}). The initial state vector defines the
population sizes in all the states at \eqn{t=0}, e.g. for a system with two
species \code{X1} and \code{X2} where both have an initial population size
of 1000 the initial state vector is defined as \code{x0 <- c(X1=1000,X2=1000)}. The elements of the vector have to be labelled using
the same notation as the state variables used in the propensity functions.
The state-change matrix defines the change in the number of individuals in
each state (rows) as caused by one reaction of a given type (columns). For
example, the state-change matrix for system with the species \eqn{S_1}{S1}
and \eqn{S_2}{S2} with two reactions \deqn{S_1
  \stackrel{c_1}{\longrightarrow} S_2}{S1 --c1--> S2} \deqn{S_2
  \stackrel{c_2}{\longrightarrow} 0}{S2 --c2--> 0}

is defined as \code{nu <- matrix(c(-1,0,+1,-1),nrow=2,byrow=TRUE)} where
\eqn{c_1}{c1} and \eqn{c_2}{c2} are the per capita reaction probabilities.
The propensity vector, \code{a}, defines the probabilities that a particular
reaction will occur over the next infinitesimal time interval \eqn{\left[
  t,t+dt \right]}{[t,t+dt]}. For example, in the previous example the
propensity vector is defined as \code{a <- c("c1*X1","c2*X2")}. The
propensity vector consists of character elements of each reaction's
propensity function where each state variable requires the corresponding
named element label in the initial state vector (\code{x0}).
}

\section{Example}{
 Irreversible isomerization:
Perhaps the simplest model that can be formulated using the \acronym{SSA}
is the irreversible isomerization (or radioactive decay) model. This model
is often used as a first pedagogic example to illustrate the \acronym{SSA}
(see e.g. Gillespie 1977). The deterministic formulation of this model is

\deqn{\frac{dX}{dt}=-cX}{dX/dt=-cX}

where the single reaction channel is

\deqn{S \stackrel{c}{\longrightarrow} 0}{S --c--> 0.}

By setting \eqn{X_0=1000} and \eqn{c=0.5} it is now simple to define this model
and run it for 10 time steps using the Direct method,

\preformatted{
  out <- ssa(x0=c(X=1000),a=c("c*X"),nu=matrix(-1),parms=c(c=0.5),tf=10)
}
The resulting time series can then be displayed by,
\preformatted{
  ssa.plot(out)
}
}

\examples{

## Irreversible isomerization
## Large initial population size (X=1000)
parms <- c(c=0.5)
x0  <- c(X=10000)
a   <- c("c*X")
nu  <- matrix(-1)
out <- ssa(x0,a,nu,parms,tf=10,method=ssa.d(),simName="Irreversible isomerization") # Direct method
plot(out$data[,1],out$data[,2]/10000,col="red",cex=0.5,pch=19)

## Smaller initial population size (X=100)
x0  <- c(X=100)
out <- ssa(x0,a,nu,parms,tf=10,method=ssa.d()) # Direct method
points(out$data[,1],out$data[,2]/100,col="green",cex=0.5,pch=19)

## Small initial population size (X=10)
x0  <- c(X=10)
out <- ssa(x0,a,nu,parms,tf=10,method=ssa.d()) # Direct method
points(out$data[,1],out$data[,2]/10,col="blue",cex=0.5,pch=19)

## Logistic growth
parms <- c(b=2, d=1, K=1000)
x0  <- c(N=500)
a   <- c("b*N", "(d+(b-d)*N/K)*N")
nu  <- matrix(c(+1,-1),ncol=2)
out <- ssa(x0,a,nu,parms,tf=10,method=ssa.d(),maxWallTime=5,simName="Logistic growth")
ssa.plot(out)

## Kermack-McKendrick SIR model
parms <- c(beta=0.001, gamma=0.1)
x0  <- c(S=499,I=1,R=0)
a   <- c("beta*S*I","gamma*I")
nu  <- matrix(c(-1,0,+1,-1,0,+1),nrow=3,byrow=TRUE)
out <- ssa(x0,a,nu,parms,tf=100,method=ssa.d(),simName="SIR model")
ssa.plot(out)

## Lotka predator-prey model
parms <- c(c1=10, c2=.01, c3=10)
x0  <- c(Y1=1000,Y2=1000)
a   <- c("c1*Y1","c2*Y1*Y2","c3*Y2")
nu  <- matrix(c(+1,-1,0,0,+1,-1),nrow=2,byrow=TRUE)
out <- ssa(x0,a,nu,parms,tf=100,method=ssa.etl(),simName="Lotka predator-prey model")
ssa.plot(out)

}
\seealso{
\link{GillespieSSA-package}, \code{\link[=ssa.d]{ssa.d()}}, \code{\link[=ssa.etl]{ssa.etl()}}, \code{\link[=ssa.btl]{ssa.btl()}}, \code{\link[=ssa.otl]{ssa.otl()}}
}
\keyword{datagen}
\keyword{misc}
\keyword{ts}
