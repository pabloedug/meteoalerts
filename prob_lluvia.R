library(XML)
fileUrl<-"http://www.aemet.es/xml/municipios/localidad_28080.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
prob24<-xpathSApply(doc,paste0("//dia[@fecha='",as.character(Sys.Date()+1),"']/prob_precipitacion[@periodo='00-24']"),xmlValue)
tempMax<-xpathSApply(doc,paste0("//dia[@fecha='",as.character(Sys.Date()+1),"']/temperatura/maxima"),xmlValue)
if(as.numeric(prob24)>50)(paste0("Coger el paraguas porque lloverá con una probabilidad del ",prob24,"%."))
if(as.numeric(tempMax)<20)(paste0("Temperatura máxima pronosticada: ",tempMax," grados."))
