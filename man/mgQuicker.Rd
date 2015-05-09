\name{mgQuicker}
\alias{mgQuicker}
\title{
Memgene analysis of genetic distance data (main interface for package)
}
\description{
 Performs multiple--typical--steps in a memgene
 analysis of genetic distance data.  Gracefully handles
 potential errors.  Steps are as follows:

 1.   Find MEM eigenvectors given 
      coordinates (\code{coords})\cr

 2.   Perform separate forward selections of positive and
      negative MEM eigenvectors against genetic distance (\code{genD}),
      to identify a significant
      subset, using parameters \code{forwardPerm} as the number of
      permutations and \code{forwardAlpha} as the alpha level
      for a significant eigenvector.  NOTE: The number of permutations
      \code{forwardPerm} is set at 100 by default to reduce analysis time for
      exploratory analyses.  This number should be increased for final analyses.\cr

 3.   Find the fit of the selected eigenvectors to the
      genetic distance data (using RDA).\cr

 4.   Optionally run a permutation test (\code{finalPerm}) for
      the fit of the selected eigenvectors to the genetic distance
      data.\cr
      
 5.   Produce MEMGENE variables using the fitted values from the RDA
      analysis.  MEMGENE variables are the eigenvectors from a PCA of the fitted
      values.  These are the product of memgene and can be used for visualization
      and subsequent analyses.

 6.   Optionally produce plots of the scores for the
      first \code{n} MEMGENE variables if \code{doPlot = n}.
}
\usage{
mgQuicker(geoD, genD)
}
\arguments{
  \item{genD}{A symmetrical distance matrix giving the genetic distances among
individual genotypes or populations}

  \item{geoD}{A symmetrical distance matrix giving the geographical distances among
individual.}
  
}
\value{
A list
}

\examples{

\dontrun{
## Prepare the radial data for analysis
radialData <- read.csv(system.file("extdata/radial.csv", package="memgene"))
radialGen <- radialData[, -c(1,2)]
radialXY <- radialData[, 1:2]
if (require(adegenet)) {
  radialDM <- codomToPropShared(radialGen)
} else {
  stop("adegenent package required to produce genetic distance matrix in example.")
}

## Run the MEMGENE analysis
radialAnalysis <- mgQuicker(radialDM, radialXY)

## Extract the scores on the first 3 MEMGENE variables
## for subsequent analysis
radialMEMGENE1 <- radialAnalysis$memgene[, 1]
radialMEMGENE2 <- radialAnalysis$memgene[, 2]
radialMEMGENE3 <- radialAnalysis$memgene[, 3]

## Find the proportion of variation explained by all MEMGENE variables
propVariation <- radialAnalysis$sdev/sum(radialAnalysis$sdev)
}
}
