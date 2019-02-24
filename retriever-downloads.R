library(rdataretriever)

mammal-community-db
mammal-masses
vertnet-mammals

download('mammal-community-db',
         path = 'analysis/data/raw_data/mammal-community-db',
         sub_dir = T)

mcdb <- fetch('mammal-community-db')

download('mammal-masses',
         path = 'analysis/data/raw_data/mammal-masses',
         sub_dir = T)

masses <- fetch('mammal-masses')

download('vertnet-mammals',
         path = 'analysis/data/raw_data/vertnet-mammals',
         sub_dir = T)

