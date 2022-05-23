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
