# R Tutorium 
# Übung: Einstieg Regex
# 09.05.2022

wd<-getwd()
newwd<-paste0(wd,"/sessions")
setwd(newwd)
getwd()

# 1. Lest alle Maerchen erneut ein und speichert sie in einer neuen Variable "maerchen_df". 
# Lest das Korpus wieder mit der gewohnten Funktion `readtext()`, allerdings dieses Mal mit den 
# zusätzlichen Argumenten `docvarsfrom = "filenames", dvsep = "_", docvarnames = c("Titel", "Jahr")` 
# ein. Lasst euch das Objekt "maerchen_df" in der Konsole ausgeben. Was hat sich verändert? 
library(readtext)
maerchen_df <- readtext("data/maerchen/*.txt", docvarsfrom = "filenames", dvsep = "_", docvarnames = c("Titel", "Jahr"))
maerchen_df


# Bevor wir fortfahren, wollen wir noch die doc_id Spalte in "dateinamen" umbenennen. 
colnames(maerchen_df)
colnames(maerchen_df)[1] <- "dateiname"
maerchen_df

# Wir sind Perfektionist*innen und wollen jetzt, dass auch "text" großgeschrieben ist. 
colnames(maerchen_df)[3] <- "titel"
colnames(maerchen_df)[4] <- "jahr"

maerchen_df

# 2. Sagen wir, wir wissen nicht mehr, ob ein bestimmtes Märchen, "Rumpelstilzchen",
# in unserem maerchen_df liegt. 

# Wir könnten mithilfe des %in% Operators nach dem Titel suchen. 

"Rumpelstilzchen" %in% maerchen_df$titel

# Unsere Abfrage wird nach "TRUE" evaluiert; Rumpelstilzchen befindet sich also in unserem 
# maerchen_df. Wenn wir die gleich Abfrage nun aber mit der Spalte "Dateiname" durchführen, 
# erhalten wir das Ergebnis "FALSE": 

"Rumpelstilzchen" %in% maerchen_df$dateiname



# Warum ist das so? Der %in% Operator überprüft nur, ob eine Zeichenkette "Rumpelstilzchen" 
# sich in der Spalte "Dateiname" befindet. Dateinamen sind aber komplexere Zeichenketten, 
# "Rumpelstilzchen" ist also nur ein "substring" der Dateinamen-Zeichenketten (strings). 
# Um Zeichenketten nach Mustern zu durchsuchen, nutzen wir in R spezielle Funktionen, die 
# die Suche mithilfe von Regulären Ausdrücken ermöglichen: 

grepl("Rumpelstilzchen", maerchen_df$dateiname)
grepl("Rumpelst(i|ie)lzchen", maerchen_df$dateiname)
grepl("Rumpel[a-zA-Z]{,9}.*", maerchen_df$dateiname)

#?grepl

# 3. Wir würden nun gerne herausfinden, wie viele Texte aus dem Korpus aus dem Hahr 1850 sind. 
# Dabei stören uns die Klammern um die Jahreszahlen. Auch, um bestimmte Zeichen oder Zeichenketten 
# zu ersetzen oder entfernen können wir Reguläre Ausdrücke verwenden: 

maerchen_df$jahr <- gsub("\\(|\\)", "", maerchen_df$jahr)
maerchen_df

# Jetzt sind wir zufrienden und können uns unserer Frage widmen, wie viele Texte aus dem Jahr 
# 1850 unser Korpus umfasst. 

# Variante 1: Kompliziert aber möglich
length(maerchen_df$dateiname[maerchen_df$jahr == 1850])

# Variante 2: Eleganter
table(maerchen_df$jahr)

# Variante 3: Was fallen euch für Lösungswege ein? 


# 4. --> Infoblock Regex: tutorium3_09052022_regex.Rmd 


# 5. Uns interessiert jetzt, ob es ein Märchen im Korpus gibt, das vor 1850 aber nach 1820 
# publiziert wurde. Wie könnte man diese Abfrage mithilfe von Regulären Ausrücken formulieren? 

grepl("182[1-9]|18[34][0-9]", maerchen_df$jahr)

View(maerchen_df)

# Wir wissen jetzt also, dass ein Märchen aus der gesuchten Zeit stammt. Aber um welches der 
# Märchen handelt es sich? 

grep("182[1-9]|18[34][0-9]", maerchen_df$jahr) # Zeilenindex ausgeben lassen
maerchen_df[4,3] # neu: Zugriff auf ein Element mithilfe von Zeilen- und Spaltenindex
#-----








