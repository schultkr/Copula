# create readme

sMACorWIN = "MAC"
sPathRootWIN = "C:/Users/Christoph/Documents/GitHub/Copulae"
sPathRootMAC = "/Users/christophschult/Gitlab/SFE-Ready/"
sReadFile = "Metainfo.txt"

if(sMACorWIN == "MAC"){
  sPathRoot = sPathRootMAC
}else{
  sPathRoot = sPathRootWIN}

# set working directory
setwd(sPathRoot)
readkey <- function()
{
  cat ("Press [enter] to continue")
  line <- readline()
}

lDirectories = dir(sPathRoot, full.names = TRUE, pattern = 'QID')
Quantlets    = dir(sPathRoot, full.names = FALSE, pattern = 'QID')
iCounter = 1
QuantletList = cbind(Quantlets, rep("NO", length(Quantlets)), rep("NO", length(Quantlets)), rep("NO", length(Quantlets)))
while(iCounter <= length(lDirectories)){
  sSubPathRoot = lDirectories[iCounter]
  QuantletName = strsplit(Quantlets[iCounter], "-")[[1]][3]
  RFile = paste(QuantletName, ".R",sep = "") 
  MFile = paste(QuantletName, ".m",sep = "")
  SASFile = paste(QuantletName, ".sas",sep = "")
  lRFile = RFile %in% dir(sSubPathRoot, full.names = FALSE)
  lMFile = MFile %in% dir(sSubPathRoot, full.names = FALSE)
  lSASFile = SASFile %in% dir(sSubPathRoot, full.names = FALSE)
  QuantletList[iCounter, 1] = QuantletName
  if(lRFile){
    QuantletList[iCounter, 2] = "YES"
  }
  if(lMFile){
    QuantletList[iCounter, 3] = "YES"
  }
  
  if(lSASFile){
    QuantletList[iCounter, 4] = "YES"
  }
  
  iCounter = iCounter + 1
}

write.table(QuantletList, "Quantlet2.txt", sep = " ")