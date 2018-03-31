###
###  ===   DESTRUCTION DE LA BASE DE DONNEES SUR LE SERVEUR DE L'UQAR
###



### Installation (si necessaire) et chargement du package requis ---------------

# install.packages("RPostgreSQL")
library(RPostgreSQL)



### Liste des tables a supprimer (ordre important) -----------------------------

tbnames <- c(
  "tab_cameras_shorebirds",
  "tab_resights",
  "ref_resights_obsconf",
  "ref_resights_datapic",
  "tab_nests_eggs",
  "tab_nests_visits",
  "tab_band_chick",
  "tab_band_data",
  "tab_nests",
  "combo_amgp",
  "ref_nest_stage",
  "ref_nest_predation",
  "ref_nest_hwfd",
  "ref_nest_fate",
  "ref_nest_failcause",
  "ref_nest_agecorr",
  "ref_species",
  "ref_bandingdata_stagecapt",
  "ref_bandingdata_sex",
  "ref_bandingdata_rbcpres",
  "ref_bandingdata_primfeath",
  "ref_bandingdata_moltbody",
  "ref_bandingdata_malcapt",
  "ref_bandingdata_legcolor",
  "ref_bandingdata_hwsex",
  "ref_bandingdata_hwcapt",
  "ref_bandingdata_hwage",
  "ref_bandingdata_fat",
  "ref_bandingdata_datapic",
  "ref_bandingdata_bandchange",
  "ref_bandingdata_age",
  "tab_band_inventory",
  "ref_band_type",
  "ref_band_size",
  "tab_artificial_nests_visits",
  "tab_artificial_nests_2005",
  "tab_artificial_nests",
  "tab_cameras_longspurs",
  "tab_longspur_growth"
)



### Database connexion ---------------------------------------------------------

drv  <- dbDriver("PostgreSQL")

mydb <- dbConnect(
  drv      = drv,
  host     = "Veuillez ecrire ici l'hote du serveur",
  port     = 5432,
  user     = "Veuillez ecrire ici le nom d'utilisateur",
  password = "Veuillez ecrire ici le mot de passe",
  dbname   = "Veuillez ecrire ici le nom de la base de données"
)



### Suppression iterative des tables -------------------------------------------

for (i in 1:length(tbnames)){
  dbSendQuery(mydb, paste("DROP TABLE IF EXISTS", tbnames[i]))
}



### Close database connexion ---------------------------------------------------

lapply(dbListConnections(PostgreSQL()), DBI::dbDisconnect)
dbUnloadDriver(dbDriver("PostgreSQL"))
