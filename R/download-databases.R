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

load_mcdb <- function() {
  species <- read.csv('analysis/data/raw_data/mcdb/MCDB_species.csv', stringsAsFactors = F)
  sites <- read.csv('analysis/data/raw_data/mcdb/MCDB_sites.csv', stringsAsFactors = F)
  communities <- read.csv('analysis/data/raw_data/mcdb/MCDB_communities.csv', stringsAsFactors = F)
  trapping <- read.csv('analysis/data/raw_data/mcdb/MCDB_trapping.csv', stringsAsFactors = F)

  mcdb <- list(species, sites, communities, trapping)
  names(mcdb) <- c('species', 'sites', 'communities', 'trapping')
  return(mcdb)

}

