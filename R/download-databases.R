#' Download the Mammal Community Database
#'
#' Saves data tables from http://esapubs.org/archive/ecol/E092/201/ to `analysis/data/raw_data`.
#'
#' @return null
#'
#' @export
download_mcdb <- function(){
  ifelse(!dir.exists(file.path('analysis/data/raw_data', 'mcdb')), dir.create(file.path('analysis/data/raw_data', 'mcdb')), FALSE)

  download.file('http://esapubs.org/archive/ecol/E092/201/data/MCDB_communities.csv',
                'analysis/data/raw_data/mcdb/MCDB_communities.csv')
  download.file('http://esapubs.org/archive/ecol/E092/201/data/MCDB_references.csv',
                'analysis/data/raw_data/mcdb/MCDB_references.csv')
  download.file('http://esapubs.org/archive/ecol/E092/201/data/MCDB_sites.csv',
                'analysis/data/raw_data/mcdb/MCDB_sites.csv')
  download.file('http://esapubs.org/archive/ecol/E092/201/data/MCDB_species.csv',
                'analysis/data/raw_data/mcdb/MCDB_species.csv')
  download.file('http://esapubs.org/archive/ecol/E092/201/data/MCDB_trapping.csv',
                'analysis/data/raw_data/mcdb/MCDB_trapping.csv')
  download.file('http://esapubs.org/archive/ecol/E092/201/metadata.htm',
                'analysis/data/raw_data/mcdb/metadata.htm')
}


#' Load the MCDB
#'
#' Loads data tables from http://esapubs.org/archive/ecol/E092/201/ saved in `analysis/data/raw_data`.
#'
#' @return list of 4 data tables: `species`, `sites`, `communities`, and `trapping`
#'
#' @export
load_mcdb <- function() {
  species <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_species.csv'), stringsAsFactors = F)
  sites <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_sites.csv'), stringsAsFactors = F)
  communities <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_communities.csv'), stringsAsFactors = F)
  trapping <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_trapping.csv'), stringsAsFactors = F)

  mcdb <- list(species, sites, communities, trapping)
  names(mcdb) <- c('species', 'sites', 'communities', 'trapping')
  return(mcdb)

}

#' Download Body Mass of Late Quaternary Mammals
#'
#' Saves data tables from https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/02-9003 to `analysis/data/raw_data`.
#'
#' @return null
#'
#' @export
download_quaternarymammals <- function(){
  ifelse(!dir.exists(file.path('analysis/data/raw_data', 'quaternarymammals')), dir.create(file.path('analysis/data/raw_data', 'quaternarymammals')), FALSE)

  download.file('https://ndownloader.figshare.com/files/5593340',
                'analysis/data/raw_data/quaternarymammals/quaternarymammals_abstract.htm')
  download.file('https://ndownloader.figshare.com/files/5593343',
                'analysis/data/raw_data/quaternarymammals/quaternarymammals_data.txt')
  download.file('https://ndownloader.figshare.com/files/5593346',
                'analysis/data/raw_data/quaternarymammals/quaternarymammals_metadata.htm')

  return(NULL)
}


#' Load the Body Mass of Quaternary Mammals databasee
#'
#' Loads Body Mass of Late Quaternary Mammals
#'
#' @return list of 4 data tables: `species`, `sites`, `communities`, and `trapping`
#'
#' @export
load_quaternarymammals <- function() {
  species <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_species.csv'), stringsAsFactors = F)
  sites <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_sites.csv'), stringsAsFactors = F)
  communities <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_communities.csv'), stringsAsFactors = F)
  trapping <- read.csv(paste0( 'analysis/data/raw_data/mcdb/MCDB_trapping.csv'), stringsAsFactors = F)

  mcdb <- list(species, sites, communities, trapping)
  names(mcdb) <- c('species', 'sites', 'communities', 'trapping')
  return(mcdb)

}
