#12213.tut xml essai

library(xml2)
library(purr)
library(stringr)

src<-("~/boxHKW/UNI/21S/DH/local/ada/ada_posts.xml")
dta<-read_xml(src3)
data<-dta

# Namespace entfernen

data %>% xml_ns()
data%>% xml_ns_strip()

# Beispiel 1: xpath-Pfade anzeigen
# Alle xpath-Pfade anzeigen
ns<-data %>% 
  xml_find_all('//*') %>%
  xml_path()
?xml_path
#uns<-unique(ns)
ns[1:100]
# Alle xpath-Pfade zu einem head-Element anzeigen
all_cat <- data %>% 
  xml_find_all('//category') %>%
  xml_path()
all_cat
all_cat[1]



# Beispiel 2: Alle Kapitelüberschriften extrahieren
# So geht es nicht
xml_text(all_heads[2])
# So geht es
all_cats <- data %>% 
  xml_find_all('//category') %>%
  xml_text()
all_cats
cats<-unique(all_cats)

# Variante für das erste Element
ch_1_cat <- xml_find_first(data, "//category")
xml_text(ch_1_cat)

all_cn <- data %>% 
  xml_find_all('//content:encoded') %>%
  xml_text()
tail(all_cn)
head(all_cn)
cats<-unique(all_cats)
#find pdf links
grepl("*pdf",all_cn)
all_cn[97]

#now regex
regexpr("(http.*\\.pdf)",all_cn)
grep("a href=.*pdf",all_cn,value = T)
all_pdf<-str_extract(all_cn,"a href=.*pdf")
head(all_pdf)
str_extract(all_pdf,"(http.*\\.pdf$)")
###
src
