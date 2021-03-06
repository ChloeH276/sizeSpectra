% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulating.R
\name{MLEbin.simulate}
\alias{MLEbin.simulate}
\title{Simulate, bin and fit data using four different binning methods and two
likelihood approaches}
\usage{
MLEbin.simulate(
  n = 1000,
  b.known = -2,
  xmin.known = 1,
  xmax.known = 1000,
  num.reps = 10000,
  seed = 42,
  binType = list(1, 5, 10, "2k"),
  vecDiffVal = 0.5,
  cut.off = NA,
  full.mult = 1.5
)
}
\arguments{
\item{n}{sample size of each simulated data set (numeric)}

\item{b.known}{known fixed value of b for all simulations}

\item{xmin.known}{known fixed value of xmin (minimum allowable x value); currently needs to
be a power of two (since makes it simpler to define the bin widths that
double in size).}

\item{xmax.known}{known fixed value of xmax (maximum allowable x value)}

\item{num.reps}{number of random samples to draw, where each sample is a set
of \code{n} random numbers (like throwing \code{n} PLB dice \code{num.reps} times)}

\item{seed}{seed for random number generator (default is the same as for MEE paper)}

\item{binType}{list containing numeric values for linear bin widths and/or
"2k" (the only other option for now) for bins that double in size. Values
other than the defaults have not yet been tested but should work.}

\item{vecDiffVal}{value to go into \code{profLike()} to compute confidence intervals.}

\item{cut.off}{cut-off value - data are only sampled \eqn{\geq} \code{cut.off}, for
Figure S.37 and S.38 and Table S.5 in MEPS paper. Each resulting sample still has
size \code{n}.}

\item{full.mult}{multiplier to generate desired sample size when using a
\code{cut.off} value.}
}
\value{
list containing:
\itemize{
\item MLE.array: three-dimensional array with element \verb{[i, j, k]} representing
the estimate of \emph{b} obtained from random sample \code{i}, bin type \code{j}, and MLE
method \code{k}. Size is \code{num.reps} \eqn{\times} \code{length(binType)} \eqn{\times} 2.
\item MLEconf.array: four-dimensional array with vector
\code{MLEconf.array[i, j, k, ]} being the confidence interval
\code{c(confMin, confMax)} for random sample \code{i}, bin type \code{j}, and MLE method
\code{k}.
\item MLE.array.parameters: list containing values of
\code{n},
\code{b.known},
\code{xmin.known},
\code{xmax.known},
\code{num.reps},
\code{binType},
\code{binTypes},
\code{binType.name}
}
}
\description{
Simulate multiple data sets from a known individual size distribution (the
PLB distribution), bin them using linear bins of width 1, 5 and 10, and
using bins that progressively double in width, and then fit each data set
using the MLEmid and MLEbin likelihood methods. As in Figures 4, 5, and
S.35-S.38, and Tables S.3-S.5 of MEPS
paper. See \code{MEPS_reproduce_2.Rmd} vignette for code for those figures and tables.
All simulated data sets have the same parameters for PLB and the same sample
size \code{n}. Individual data sets are not saved as they quickly take up a lot
of memory (would be \code{num.reps} \eqn{\times} \code{n} random numbers, which for the
default values is 10^7).
}
\author{
Andrew Edwards
}
