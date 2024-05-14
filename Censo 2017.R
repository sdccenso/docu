library(arrow)
library(dplyr)

# Obtener la lista de archivos CSV en la carpeta "datos"
archivos_feather <- list.files("C:/Users/hleiva/Desktop/CENSO 2017/2021-03-08_Entrega_Arch-CPV2017", pattern = "\\.feather$")




persona_comunaC10101<-read_feather("C:/Users/hleiva/Desktop/CENSO 2017/2021-03-08_Entrega_Arch-CPV2017/Format-PER.C1101.feather")

names(archivos_feather)
class(archivos_feather)
library(stringr)
archivos_feather %in% c("Estr-PER.C8412.feather")

stringr::str_starts(archivos_feather,"Format-")
archivos_feather[which(stringr::str_starts(archivos_feather,"Format-"))]

table(stringr::str_starts(archivos_feather,"Format-"))

# a=1:5
# sprintf("hola tengo %s",a)

#leer todos los que empiezan con format
leer=archivos_feather[which(stringr::str_starts(archivos_feather,"Format-"))]

#los que contienen per
persona=leer[which(stringr::str_detect(leer,"PER"))]

#extraer comunas
p=stringr::str_sub(persona,-14,-9)
p
stringr::str_remove(p,"[.]")


#eval(sprintf("PER_%s=read_feather('C:/Users/hleiva/Desktop/CENSO 2017/2021-03-08_Entrega_Arch-CPV2017/%s')",stringr::str_sub(persona,-13,-9),persona))

eval(parse(text=sprintf("PER_%s=read_feather('C:/Users/hleiva/Desktop/CENSO 2017/2021-03-08_Entrega_Arch-CPV2017/%s')",stringr::str_sub(persona,-13,-9),persona)),envir=.GlobalEnv)
