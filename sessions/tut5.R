src1<-("https://textgridlab.org/1.0/tgcrud-public/rest/textgrid:rksp.0/data")
src2<-("https://textgridlab.org/1.0/tgcrud-public/rest/textgrid:rkpt.0/data")
src3<-("https://dracor.org/api/corpora/ger/play/lessing-emilia-galotti/tei")
src4<-("https://dracor.org/api/corpora/ger/play/lessing-nathan-der-weise/tei")
src5<-("https://dracor.org/api/corpora/ger/play/lessing-der-misogyn/tei")

lessing1<-read_xml(src3)
lessing2<-read_xml(src4)
lessing3<-read_xml(src5)

write_xml(lessing1,"data/lessing_emilia.xml")
write_xml(lessing2,"data/lessing_nathan.xml")
write_xml(lessing3,"data/lessing_misogyn.xml")

files<-list.files(pattern="*lessing*",path = "sessions/data",include.dirs = T,full.names = T)
data_1 <- map(files, read_xml)
library(purr)
data_1 <- map(files, read_xml)
# Namespace entfernen
data_1[[2]] %>% xml_ns()
data_1[[3]]%>% xml_ns_strip()

data_1 %>% xml_find_all('//*') %>% xml_path()
data_1
# Beispiel 1: xpath-Pfade anzeigen
# Alle xpath-Pfade anzeigen
data %>% 
  xml_find_all('//*') %>%
  xml_path()
?xml_path

# Alle xpath-Pfade zu einem head-Element anzeigen
all_heads <- data %>% 
  xml_find_all('//category') %>%
  xml_path()
all_heads
all_heads[1]
