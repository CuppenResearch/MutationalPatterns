% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_mutation_density.R
\name{bin_mutation_density}
\alias{bin_mutation_density}
\title{Bin the genome based on mutation density}
\usage{
bin_mutation_density(vcf_list, ref_genome, nrbins = 3, man_dens_cutoffs = NA)
}
\arguments{
\item{vcf_list}{GRangesList or GRanges object.}

\item{ref_genome}{BSgenome reference genome object}

\item{nrbins}{The number of bins in which to separate the genome}

\item{man_dens_cutoffs}{Manual density cutoffs to use.}
}
\value{
GRangesList
}
\description{
This function splits the genome based on the mutation density.
The density is calculated per chromosome. The density is split
into bins. The difference in density between subsequent bins is the same
for all bins. In other words, the difference in density between bins 1 and
2 is the same as between bins 2 and 3.
The function returns a GRangesList. Each GRanges in the list contains the
regions associated with that bin. This can be used with the
'split_muts_region()' function.
}
\examples{

### See the 'read_vcfs_as_granges()' example for how we obtained the
## following data:
grl <- readRDS(system.file("states/read_vcfs_as_granges_output.rds",
  package = "MutationalPatterns"
))

## Load the corresponding reference genome.
ref_genome <- "BSgenome.Hsapiens.UCSC.hg19"
library(ref_genome, character.only = TRUE)

## Determine region density
dens_grl <- bin_mutation_density(grl, ref_genome, nrbins = 3)
names(dens_grl) <- c("Low", "Medium", "High")


## You can also use manual cutoffs. This feature is meant for more
## advanced users. It can be usefull if you want to find highly mutated regions, with
## a consistent cutoff between analyses.
dens_grl_man <- bin_mutation_density(grl, ref_genome, man_dens_cutoffs = c(0, 2e-08, 1))
}
\seealso{
Other genomic_regions: 
\code{\link{lengthen_mut_matrix}()},
\code{\link{plot_profile_region}()},
\code{\link{plot_spectrum_region}()},
\code{\link{split_muts_region}()}
}
\concept{genomic_regions}
