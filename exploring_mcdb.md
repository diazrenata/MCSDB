Exploring the MCDB
================
Renata Diaz
1/4/2019

Sourcing
========

Katherine M. Thibault, Sarah R. Supp, Mikaelle Giffin, Ethan P. White, and S. K. Morgan Ernest. 2011. Species composition and abundance of mammalian communities. Ecology 92:2316.

<http://esapubs.org/archive/ecol/E092/201/>

Quoting from the abstract:

> Here, we provide a data set that includes species lists for 1000 mammal communities, excluding bats, with species-level abundances available for 940 of these communities. All communities found in the literature that included complete, site-specific sampling data, composed of species lists with or without associated abundances, were included in the data set. Most, but not all, sites are limited to species groups that are sampled using a single technique (e.g., small mammals sampled with Sherman traps). The data set consists of 7977 records from 1000 georeferenced sites encompassing a variety of habitats throughout the world, and it includes data on 660 mammal species with sizes ranging from 2 g to &gt;500 kg.

Download and load data:

``` r
download_mcdb()
```

``` r
mcdb <- load_mcdb()
str(mcdb)
```

    ## List of 4
    ##  $ species    :'data.frame': 700 obs. of  5 variables:
    ##   ..$ Species_ID   : chr [1:700] "ABBE" "ABLO" "ABOL" "ACSP" ...
    ##   ..$ Family       : chr [1:700] "Abrocomidae" "Cricetidae" "Cricetidae" "Muridae" ...
    ##   ..$ Genus        : chr [1:700] "Abrocoma" "Abrothrix" "Abrothrix" "Acomys" ...
    ##   ..$ Species      : chr [1:700] "bennettii" "longipilis" "olivaceus" "spinosissimus" ...
    ##   ..$ Species_level: int [1:700] 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ sites      :'data.frame': 1000 obs. of  19 variables:
    ##   ..$ Site_ID               : int [1:1000] 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 ...
    ##   ..$ Reference_ID          : chr [1:1000] "Smith2001" "Smith2001" "Smith2001" "Smith2001" ...
    ##   ..$ Location              : chr [1:1000] "Tongass; Dog Island" "Tongass; Old Tom Creek" "Tongass; Rio Roberts" "Tongass; Kadin Island" ...
    ##   ..$ Country               : chr [1:1000] "USA" "USA" "USA" "USA" ...
    ##   ..$ State                 : chr [1:1000] "AK" "AK" "AK" "AK" ...
    ##   ..$ Latitude              : chr [1:1000] "54.96667" "55.38333" "55.7" "56.51667" ...
    ##   ..$ Longitude             : chr [1:1000] "-131.31667" "-132.41667" "-132.71667" "-132.45" ...
    ##   ..$ Uncertainty_radius    : chr [1:1000] "1" "1" "1" "1" ...
    ##   ..$ Elevation_low         : chr [1:1000] "0" "0" "18" "0" ...
    ##   ..$ Elevation_high        : chr [1:1000] "15" "450" "76" "530" ...
    ##   ..$ Habitat_description   : chr [1:1000] "typical SE AK vegetation; bog in center of island; shoreline; forest" "typical SE AK vegetation; shoreline; forest" "riparian flood-plain spruce stands; upland evergreen forest; shoreline; forest" "loess soils; shoreline; forest" ...
    ##   ..$ Habitat_code          : chr [1:1000] "CF" "CF" "CF" "CF" ...
    ##   ..$ Abundance_data_present: chr [1:1000] "some" "some" "some" "some" ...
    ##   ..$ Abundance_data_format : chr [1:1000] "raw" "raw" "raw" "raw" ...
    ##   ..$ Spatial_extent        : chr [1:1000] "1250" "1250" "1250" "1250" ...
    ##   ..$ Study_duration        : chr [1:1000] "1" "1" "1" "1" ...
    ##   ..$ Time_series           : int [1:1000] 0 0 0 0 0 0 0 0 0 0 ...
    ##   ..$ N_years               : chr [1:1000] "1" "1" "1" "1" ...
    ##   ..$ Notes                 : chr [1:1000] "NULL" "NULL" "NULL" "NULL" ...
    ##  $ communities:'data.frame': 7977 obs. of  6 variables:
    ##   ..$ Site_ID      : int [1:7977] 1008 1008 1008 1008 1008 1008 1008 1008 1008 1008 ...
    ##   ..$ Initial_year : chr [1:7977] "2002" "2002" "2002" "2002" ...
    ##   ..$ Species_ID   : chr [1:7977] "CHPE" "CHSX" "DIDE" "DIME" ...
    ##   ..$ Presence_only: int [1:7977] 0 0 0 0 0 0 0 0 0 0 ...
    ##   ..$ Abundance    : chr [1:7977] "52" "4" "12" "20" ...
    ##   ..$ Mass         : chr [1:7977] "NULL" "NULL" "NULL" "NULL" ...
    ##  $ trapping   :'data.frame': 1169 obs. of  11 variables:
    ##   ..$ Site_ID           : int [1:1169] 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 ...
    ##   ..$ Initial_year      : chr [1:1169] "1997" "1997" "1997" "1997" ...
    ##   ..$ Final_year        : chr [1:1169] "1997" "1997" "1997" "1997" ...
    ##   ..$ N_sampling_months : chr [1:1169] "1" "1" "1" "1" ...
    ##   ..$ Trap_nights       : chr [1:1169] "500" "500" "500" "500" ...
    ##   ..$ Months_of_sampling: chr [1:1169] "June" "June" "June" "June" ...
    ##   ..$ Pitfall_traps     : chr [1:1169] "1" "1" "1" "1" ...
    ##   ..$ Small_traps       : chr [1:1169] "1" "1" "1" "1" ...
    ##   ..$ Large_traps       : chr [1:1169] "0" "0" "0" "0" ...
    ##   ..$ Snap_traps        : chr [1:1169] "1" "1" "1" "1" ...
    ##   ..$ Notes             : chr [1:1169] "NULL" "NULL" "NULL" "NULL" ...

Description of data tables
==========================

Metadata/detailed descriptions here: <http://esapubs.org/archive/ecol/E092/201/metadata.htm>

`communities` is the main data table. Communities are uniquely identified via `Site_ID` and `Initial_year`, as some sites have multiple years of data. Some of the species-abundance records also include the `Mass`, which is the *average mass of the individuals of a given species captured at the particular site*. This will be useful for simulating error, but I will still need to find intraspecific size data to model the shape & variance of the intraspecific size distribution.

`sites` contains information about each site. The `Site_ID` connects to `communities`. There's a `Reference_ID`. Importantly for my purposes, there's `Abundance_data_present` (none/some/all) and `Abundance_data_format` (none, raw, density estimate, or relative abundance). I will try to find size data for everything except where no abundance data is available. But to test EER and further explore abundance currencies, I will want to treat at least the relative abundance data differently from raw/density estimates.

The `species` table links the `Species_ID`s to the full epithets and notes whether each taxon has been identified to species-level.

The `trapping` table contains details of timing & type of trapping.

Summaries of records
====================

Quoting the abstract again:

> The data set consists of 7977 records from 1000 georeferenced sites encompassing a variety of habitats throughout the world, and it includes data on 660 mammal species with sizes ranging from 2 g to &gt;500 kg.

-   How many species-site records have a site-specific average mass?

``` r
communities <- mcdb$communities %>%
  dplyr::mutate(Mass = as.numeric(Mass))
```

    ## Warning: NAs introduced by coercion

``` r
# How many mass values?
length(which(!is.na(communities$Mass)))
```

    ## [1] 765

``` r
# 765

# How many unique species? 

species_with_masses <- communities %>%
  dplyr::filter(!is.na(Mass)) %>%
  dplyr::select(Species_ID) %>%
  dplyr::distinct() %>%
  dplyr::mutate(record_exists = 1)

nrow(species_with_masses)
```

    ## [1] 189

``` r
# 189
```

-   Of species-site that don't have site-specific average mass, does that species have a mass elsewhere in the database? (Won't necessarily use it, but good to know)

``` r
species_no_masses <- communities %>%
  dplyr::filter(is.na(Mass)) %>%
  dplyr::select(Species_ID) %>%
  dplyr::left_join(species_with_masses, by = 'Species_ID') 

# No masses overall:
nrow(species_no_masses)
```

    ## [1] 7212

``` r
# 7212 records in total
length(unique(species_no_masses$Species_ID))
```

    ## [1] 655

``` r
# 655 unique species with no mass
  
# No masses anywhere in the database:
no_masses <- dplyr::filter(species_no_masses, 
                    is.na(record_exists))
nrow(no_masses)
```

    ## [1] 4018

``` r
# 4018 records
length(unique(no_masses$Species_ID))
```

    ## [1] 511

``` r
# 511 species with no mass

# No mass at a specific site, but a mass somewhere in the db:
a_mass <- dplyr::filter(species_no_masses, 
                    record_exists == 1)
nrow(a_mass)
```

    ## [1] 3194

``` r
# 3194 records
length(unique(a_mass$Species_ID))
```

    ## [1] 144

``` r
# 144 species WITH masses somewhere in the database
```

-   Of species, but especially those species without any mass records, how many have masses in \[Mammal Size Database\]? Cross-matching these databases might take some time - TBD.

Once I have the size database in as well, I wonder if I can track the references down for variance. The handbook I got from the library doesn't have variance.

If a species doesn't have an average mass in either database, does that mean it isn't in the references of those databases?
