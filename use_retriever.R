library(mcsdb)

check_default_data_path()

install_retriever_data("mammal-community-db")
install_retriever_data("mammal-masses")
install_retriever_data("vertnet-mammals")


mcdb <- import_retriever_data("mammal-community-db")
qmammals <- import_retriever_data("mammal-masses")
