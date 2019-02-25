library(mcsdb)

check_default_data_path()

install_retriever_data("mammal-community-db")

mcdb <- import_retriever_data("mammal-community-db")
