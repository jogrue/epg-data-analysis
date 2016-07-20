# Set directories --------------------------------------------------------------
# You can set your own working directory here
workingdir <- getwd()
setwd(workingdir)
data.dir <- paste0(workingdir,"/data")
xmltv.se.dir <- paste0(workingdir,"/data/xmltv/xmltv.xmltv.se")

# Load packages ----------------------------------------------------------------
require("devtools")
# install_github("jogrue/rXMLTV")
install_local("rXMLTV")

## Read xmltv.se data for 2015 -------------------------------------------------
# Tests all files
err.files <-
  TestMultipleXmltvFiles(xmltv.dir = xmltv.se.dir,
                         regex.pattern = ".*2015.*\\.xml.gz", verbose = FALSE)

# Read all data from xmltv.se in 2015 (Be careful: takes a very long time!)
xmltvdata <-
  ReadMultipleXmltvFiles(xmltv.dir = xmltv.se.dir,
                         regex.pattern = ".*2015.*\\.xml.gz", verbose = TRUE)
save(xmltvdata, file = paste0(data.dir,"data_xmltv_se_2015_all_raw.RData"))

# Keep only channels from the DACH region for 2015
channels.to.keep <- c(
  # Germany
  "daserste.de",
  "zdf.de",
  "rtl.de",
  "sat1.de",
  "prosieben.de",
  "kabel1.de",
  "rtl2.de",
  "vox",
  "tele5",
  "3sat.de",
  "arte.de",
  # Austria
  "orf1.at",
  "orf2.at",
  "orf3.at",
  "sportplus.orf.at",
  "atv.at",
  "atv2.at",
  "puls4.at",
  "servustv.de",
  # Switzerland
  "sf1.srf.ch",
  "sf2.srf.ch",
  # "startv.ch",
  "3plus.tv"
  ) # UK is not available
xmltvdata.sel <- xmltvdata[xmltvdata$r10.channel %in% channels.to.keep,]
rm(xmltvdata)
save(xmltvdata.sel, file = paste0(data.dir,"data_xmltv_se_2015_dach_raw.RData"))

## Read xmltv.se data for 2016 -------------------------------------------------
# Tests all files
err.files <-
  TestMultipleXmltvFiles(xmltv.dir = xmltv.se.dir,
                         regex.pattern = ".*2016.*\\.xml.gz", verbose = FALSE)

# Read all data from xmltv.se in 2016 (Be careful: takes a very long time!)
xmltvdata <-
  ReadMultipleXmltvFiles(xmltv.dir = xmltv.se.dir,
                         regex.pattern = ".*2016.*\\.xml.gz", verbose = TRUE)
save(xmltvdata, file = paste0(data.dir,"data_xmltv_se_2016_all_raw.RData"))

# Keep only channels from the DACH region for 2016
channels.to.keep <- c(
  # Germany
  "daserste.de",
  "zdf.de",
  "rtl.de",
  "sat1.de",
  "prosieben.de",
  "kabel1.de",
  "rtl2.de",
  "vox",
  "tele5",
  "3sat.de",
  "arte.de",
  # Austria
  "orf1.at",
  "orf2.at",
  "orf3.at",
  "sportplus.orf.at",
  "atv.at",
  "atv2.at",
  "puls4.at",
  "servustv.de",
  # Switzerland
  "sf1.srf.ch",
  "sf2.srf.ch",
  # "startv.ch",
  "3plus.tv"
) # UK is not available
xmltvdata.sel <- xmltvdata[xmltvdata$r10.channel %in% channels.to.keep,]
rm(xmltvdata)
save(xmltvdata.sel, file = paste0(data.dir,"data_xmltv_se_2016_dach_raw.RData"))


# temp1 <- list.files(xmltv.se.dir, pattern = ".*2015.*\\.xml.gz")
#
# temp1 <- ReadXmltvFile("F:/3_Projekt_EPG/Examples/webgrab-data-example.xml")
# temp2 <- ReadXmltvFile("F:/3_Projekt_EPG/Examples/daserste.de_2015-10-13.xml.gz")
# temp3 <- ReadMultipleXmltvFiles("F:/3_Projekt_EPG/Examples/")
# xmltv.root <- xmlRoot(xmlTreeParse(file = "F:/3_Projekt_EPG/Examples/webgrab-data-example.xml", useInternal = TRUE))
# xmltv.programmes <- getNodeSet(xmltv.root,"//programme")
# xmltv.data <- .ParseProgrammes(xmltv.programmes)
# temp <- NULL
# for (i in 1:length(xmltv.programmes)) {
#   temp <- .ParseProgramme(xmltv.programmes[[i]])
#   print(i)
# }
source("xmltv.R")
load("./data/data_xmltv_se_2015_all_raw.RData")
xmltvdata <- .AssignXmltvDataRaw(xmltvdata)
save(xmltvdata, file = "./data/data_xmltv_se_2015_all_raw_2.RData")
rm(xmltvdata)
load("./data/data_xmltv_se_2015_dach_raw.RData")
xmltvdata.sel <- .AssignXmltvDataRaw(xmltvdata.sel)
save(xmltvdata.sel, file = "./data/data_xmltv_se_2015_dach_raw_2.RData")
