% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitting.R
\name{totalBiomass}
\alias{totalBiomass}
\title{Calculate the total biomass for given parameter values for PLB model}
\usage{
totalBiomass(bvec, r = NULL, xmin = NULL, xmax = NULL, n = 1000)
}
\arguments{
\item{bvec}{vector of size-spectrum exponents (values of \code{b})}

\item{r}{ratio of \code{xmax/xmin}. Need to specificy \code{r} or \code{xmin} and \code{xmax}, all scalars.}

\item{xmin}{minimum allowable body size}

\item{xmax}{maximum allowable body size}

\item{n}{number of individuals}
}
\value{
vector of total biomass values corresponding to the values of \code{b} in
\code{bvec}; total biomass has same units as \code{xmin} (if \code{xmin} and \code{xmax} specified),
or is nondimensional if \code{r} is specified.
}
\description{
Calculate the total biomass (in same units as \code{xmin} or nondimensionalised
and scaled to \code{xmin}) for given values of \code{b} (in the vector \code{bvec}), \code{n}
and either both \code{xmin} and \code{xmax} or just \code{r}.
}
\author{
Andrew Edwards
}
