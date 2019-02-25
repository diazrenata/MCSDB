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
install_retriever_data("mammal-community-db")
```

``` r
mcdb <- import_retriever_data("mammal-community-db")
str(mcdb)
```

    ## List of 5
    ##  $ mammal_community_db_communities:'data.frame': 7977 obs. of  6 variables:
    ##   ..$ site_id      : int [1:7977] 1008 1008 1008 1008 1008 1008 1008 1008 1008 1008 ...
    ##   ..$ initial_year : num [1:7977] 2002 2002 2002 2002 2002 ...
    ##   ..$ species_id   : Factor w/ 700 levels "ABBE","ABLO",..: 85 88 155 158 472 478 377 461 463 464 ...
    ##   ..$ presence_only: int [1:7977] 0 0 0 0 0 0 0 0 0 0 ...
    ##   ..$ abundance    : num [1:7977] 52 4 12 20 5 9 50 18 79 59 ...
    ##   ..$ mass         : int [1:7977] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ mammal_community_db_references :'data.frame': 186 obs. of  12 variables:
    ##   ..$ reference_id    : Factor w/ 186 levels "Anon1976","Anon1987",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##   ..$ reference_source: Factor w/ 11 levels "BioOne","Brown & Kurzius 1987",..: 3 3 5 11 9 7 4 9 11 1 ...
    ##   ..$ authors         : Factor w/ 182 levels "A. D. Griffiths and B. W. Brook",..: 10 10 130 106 166 125 133 66 8 108 ...
    ##   ..$ year_published  : int [1:186] 1976 1987 1987 2006 2001 2000 2005 2002 1989 2000 ...
    ##   ..$ title           : Factor w/ 181 levels "A comparison of ground-dwelling small mammal communities in primary and secondary tropical rainforests in China",..: 20 91 135 28 72 37 75 96 90 100 ...
    ##   ..$ source          : Factor w/ 108 levels "","Acta Zoologica Lituanica",..: 27 105 73 2 65 61 22 85 39 36 ...
    ##   ..$ volume          : int [1:186] 4 NA 68 16 NA NA 86 NA 12 81 ...
    ##   ..$ first_page      : int [1:186] 88 NA 94 137 1 NA 3130 1 37 77 ...
    ##   ..$ last_page       : int [1:186] 95 NA 102 142 114 NA 3130 119 39 85 ...
    ##   ..$ n_pages         : int [1:186] 8 28 9 6 114 56 1 119 3 9 ...
    ##   ..$ sudocs          : Factor w/ 11 levels "","A 13.78: INT-408",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##   ..$ n_sites         : int [1:186] 3 1 12 1 1 7 2 4 3 2 ...
    ##  $ mammal_community_db_sites      :'data.frame': 1000 obs. of  19 variables:
    ##   ..$ site_id               : int [1:1000] 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 ...
    ##   ..$ reference_id          : Factor w/ 186 levels "Anon1976","Anon1987",..: 156 156 156 156 156 156 156 41 41 41 ...
    ##   ..$ location              : Factor w/ 632 levels "0.9 km north of Highway 58; 5 km E x S of Monolith; Kern County",..: 590 593 594 591 595 589 592 296 390 406 ...
    ##   ..$ country               : Factor w/ 40 levels "Argentina","Australia",..: 38 38 38 38 38 38 38 38 38 38 ...
    ##   ..$ state                 : Factor w/ 49 levels "","AK","AR","AZ",..: 2 2 2 2 2 2 2 6 6 4 ...
    ##   ..$ latitude              : num [1:1000] 55 55.4 55.7 56.5 57.4 ...
    ##   ..$ longitude             : num [1:1000] -131 -132 -133 -132 -134 ...
    ##   ..$ uncertainty_radius    : num [1:1000] 1 1 1 1 1 1 1 90 49 93 ...
    ##   ..$ elevation_low         : int [1:1000] 0 0 18 0 0 30 0 -86 300 191 ...
    ##   ..$ elevation_high        : int [1:1000] 15 450 76 530 863 682 975 3368 1773 2156 ...
    ##   ..$ habitat_description   : Factor w/ 580 levels "","<5 yr old clearcut edge; site 1; mixed hardwood forest",..: 527 528 389 252 167 72 169 254 479 356 ...
    ##   ..$ habitat_code          : Factor w/ 14 levels "AG","CF","CLF",..: 2 2 2 2 2 2 2 4 7 10 ...
    ##   ..$ abundance_data_present: Factor w/ 3 levels "","all","some": 3 3 3 3 3 3 3 2 2 2 ...
    ##   ..$ abundance_data_format : Factor w/ 3 levels "","estimate",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##   ..$ spatial_extent        : num [1:1000] 1250 1250 1250 1250 1250 1250 1250 NA NA NA ...
    ##   ..$ study_duration        : int [1:1000] 1 1 1 1 1 1 1 25 24 17 ...
    ##   ..$ time_series           : int [1:1000] 0 0 0 0 0 0 0 0 0 0 ...
    ##   ..$ n_years               : int [1:1000] 1 1 1 1 1 1 1 3 3 2 ...
    ##   ..$ notes                 : Factor w/ 16 levels "","abundance presented as average number of unique individuals captured",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ mammal_community_db_species    :'data.frame': 700 obs. of  5 variables:
    ##   ..$ species_id   : Factor w/ 700 levels "ABBE","ABLO",..: 1 2 3 5 6 4 7 8 9 10 ...
    ##   ..$ family       : Factor w/ 49 levels "Abrocomidae",..: 1 11 11 32 32 2 32 32 11 11 ...
    ##   ..$ genus        : Factor w/ 261 levels "Abrocoma","Abrothrix",..: 1 2 2 3 3 4 5 5 6 6 ...
    ##   ..$ species      : Factor w/ 568 levels "adusta","aestuans",..: 61 292 390 488 563 437 109 232 43 135 ...
    ##   ..$ species_level: int [1:700] 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ mammal_community_db_trapping   :'data.frame': 1169 obs. of  11 variables:
    ##   ..$ site_id           : int [1:1169] 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010 ...
    ##   ..$ initial_year      : num [1:1169] 1997 1997 1997 1997 1997 ...
    ##   ..$ final_year        : num [1:1169] 1997 1997 1997 1997 1997 ...
    ##   ..$ n_sampling_months : int [1:1169] 1 1 1 1 1 1 1 10 10 5 ...
    ##   ..$ trap_nights       : int [1:1169] 500 500 500 500 1000 500 500 2397 1492 1313 ...
    ##   ..$ months_of_sampling: Factor w/ 145 levels "","3 month intervals",..: 81 81 81 81 81 81 81 17 15 120 ...
    ##   ..$ pitfall_traps     : int [1:1169] 1 1 1 1 1 1 1 0 0 0 ...
    ##   ..$ small_traps       : int [1:1169] 1 1 1 1 1 1 1 1 1 1 ...
    ##   ..$ large_traps       : int [1:1169] 0 0 0 0 0 0 0 1 1 1 ...
    ##   ..$ snap_traps        : int [1:1169] 1 1 1 1 1 1 1 0 0 0 ...
    ##   ..$ notes             : Factor w/ 61 levels "","1-2 Jul; 10-15 Oct; 23 Nov 2002; 28-31 Mar; 6-10 & 21-27 May; 26-28 Sep 2003; 30 Apr-3 May; 8-14 & 22-23 Jun 2004",..: 1 1 1 1 1 1 1 8 2 4 ...

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
communities <- mcdb$mammal_community_db_communities %>%
  dplyr::mutate(mass = as.numeric(mass))

# How many mass values?
length(which(!is.na(communities$mass)))
```

    ## [1] 765

``` r
# 765

# How many unique species? 

species_with_masses <- communities %>%
  dplyr::filter(!is.na(mass)) %>%
  dplyr::select(species_id) %>%
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
  dplyr::filter(is.na(mass)) %>%
  dplyr::select(species_id) %>%
  dplyr::left_join(species_with_masses, by = 'species_id') 

# No masses overall:
nrow(species_no_masses)
```

    ## [1] 7212

``` r
# 7212 records in total
length(unique(species_no_masses$species_id))
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
length(unique(no_masses$species_id))
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
length(unique(a_mass$species_id))
```

    ## [1] 144

``` r
# 144 species WITH masses somewhere in the database
```

-   Of species, but especially those species without any mass records, how many have masses in \[Mammal Size Database\]? Cross-matching these databases might take some time - TBD.

Once I have the size database in as well, I wonder if I can track the references down for variance. The handbook I got from the library doesn't have variance.

If a species doesn't have an average mass in either database, does that mean it isn't in the references of those databases?

### Looking at mammal masses / MCDB overlap

Note that the quaternary mammals dataset is continent-level *averages*. Might be more useful as a source of refs?

``` r
qmammals <- import_retriever_data("mammal-masses")

qmammal_species <- qmammals$mammal_masses_MammalMasses %>%
  dplyr::select(genus, species) %>%
  dplyr::mutate(present_in_qmammals = 1) %>%
  dplyr::mutate(genus = as.character(genus),
                species = as.character(species))

mcdb_species <- mcdb$mammal_community_db_species %>%
  dplyr::select(genus, species) %>%
  dplyr::mutate(genus = as.character(genus),
                species = as.character(species))

species_overlap <- mcdb_species %>%
  dplyr::left_join(qmammal_species, by = c('genus', 'species')) %>%
  dplyr::filter(!is.na(present_in_qmammals))
nrow(species_overlap)
```

    ## [1] 682

``` r
# note that some of these are duplicate - multiple matches

species_notfound <- mcdb_species %>%
  dplyr::left_join(qmammal_species, by = c('genus', 'species')) %>%
  dplyr::filter(is.na(present_in_qmammals))
nrow(species_notfound)
```

    ## [1] 113

There are 113 species not found in the quaternary mammals database. Many of these look like they might be spelling/typing stuff.
