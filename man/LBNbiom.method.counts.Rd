% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitting.R
\name{LBNbiom.method.counts}
\alias{LBNbiom.method.counts}
\title{Use the LBN and LB methods to calculate the slope of the biomass size spectra for count data}
\usage{
LBNbiom.method.counts(valCounts, binBreaks = NULL, lowerCutOff = 0)
}
\arguments{
\item{valCounts}{valCounts: data.frame (or tbl_df) with columns \code{bodyMass}
and \code{Number}, which is the count for each body mass. \code{bodyMass} can
represent midpoints, say, of existing bins, or be the actual
species-specific converted-to-bodyMass values. Number can be non-integer,
which can arise from standardising, say, trawl data scaled to be per hour.}

\item{binBreaks}{breaks for the bins to be used to bin the data and
then fit the regression. If not provided then it calculates
them as bin widths that double in size that encompass the data,
resulting in \code{binBreaks} that are powers of 2, giving  ..., 0.25, 0.5, 1,
2, 4, 8, 16,...  as necessary.}

\item{lowerCutOff}{body mass value representing the lower cut off for
the range being fit.}
}
\value{
list containing:
\itemize{
\item \code{valCounts2}: dataframe \code{valCounts} with extra columns \code{binMin}, the
minimum of the bin into which that \code{bodyMass} falls, and \code{biomass},
the biomass corresponding to \code{bodyMass * Number}.
\item \code{binVals}: dataframe with a row for each bin and columns:
\itemize{
\item \code{binMid}, \code{binMin}, \code{binMax}, \code{binWidth}: midpoint, minimum,
maximum, and width, respectively, of the bin
\item \code{totalBiom}: total biomass in that bin
\item \code{totalBiomNorm}: normalised total biomass in that bin,
defined as \code{totalBiom / binWidth}
\item \code{log10....}: \code{log10} of some of the above quantities
}
\item \code{norm.lm}: \code{lm()} result of the linear regression fit using normalised
biomass in each bin
\item \code{norm.slope}: slope of the linear regression fit using normalised
biomass in each bin
\item \code{unNorm.lm}: \code{lm()} result of the linear regression fit when not
normalising the biomass in each bin
\item \verb{unNorm.slope:} slope of the linear regression fit when not
normalising the biomass in each bin
}
}
\description{
Use the log-binning with normalisation technique to calculate the slope of
the biomass size spectra, for count data. Slope is from fitting
a linear regression of \verb{log10(normalised biomass in bin)}
against \verb{log10(midpoint of bin)}. Bins can be defined by user,
else are created to double in size. Also calculates slope
for biomasses not being normalised (LB method).
}
\author{
Andrew Edwards
}
