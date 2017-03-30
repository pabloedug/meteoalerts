library(optparse)
library(XML)

option_list <- list(
  make_option(c("-m", "--municipio"), default=28080,
              help="Codigo del municipio en el INE [default %default]"),
  make_option(c("-p","--prec"), default=50,
              help="Probabilidad de precipitaciones en porcentaje por encima de la cual se envia alerta [default %default]"),
  make_option(c("-t","--temp"), default=10,
              help="Temperatura en grados por debajo de la cual se envia alerta [default %default]")
)

opt <- parse_args(OptionParser(option_list=option_list))

fileUrl<- paste0("http://www.aemet.es/xml/municipios/localidad_",opt$municipio,".xml")

doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
prob24<-xpathSApply(doc,paste0("//dia[@fecha='",as.character(Sys.Date()+1),"']/prob_precipitacion[@periodo='00-24']"),xmlValue)
tempMax<-xpathSApply(doc,paste0("//dia[@fecha='",as.character(Sys.Date()+1),"']/temperatura/maxima"),xmlValue)
if(as.numeric(prob24)>opt$prec)(paste0("Coger el paraguas porque lloverá con una probabilidad del ",prob24,"%."))
if(as.numeric(tempMax)<opt$temp)(paste0("Temperatura máxima pronosticada: ",tempMax," grados."))
