#12215.dramenanalyse
#20220525(16.43)
####################
# API fetch dracor TEI
#if (!require("jsonlite","httr","purrr","xml2")) install.packages("jsonlite","httr","purrr","xml2")
library(jsonlite)
library(httr)
library(purrr)
library(xml2)
corpusname<-"ger"
base_url<-"https://dracor.org/api"
full_url<-paste(base_url,"corpora",corpusname,sep="/")
api_call<-httr::GET(full_url)
httr::content(api_call,"text")
api_df<-fromJSON(content(api_call,"text"),simplifyDataFrame = T)
plays<-api_df$dramas
#################
#12216.ascension
#sample GET: 
#get<-"https://dracor.org/api/corpora/ger/play/buechner-woyzeck/tei"

#extract play GETs:
#all buechner plays:
seek<-"buechner"
grep1<-grep(seek,plays$name)
#grep1
get.url<-plays$name[grep1]
plays_url<-paste(base_url,"play",sep = "/")
tei_url_full<-paste(plays_url,map_chr(get.url,paste),"tei",sep="/")
corpus3<-map(tei_url_full,read_xml)
#wks.
#####
tei_url_full
c1<-read_xml(tei_url_full[1])
