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
QuantletList = cbind(Quantlets, rep("", length(Quantlets)), rep("", length(Quantlets)))
while(iCounter <= length(lDirectories)){
  sSubPathRoot = setwd(lDirectories[iCounter]) 
  QuantletName = strsplit(Quantlets[iCounter], "-")[[1]][3]
  RFile = paste(QuantletName, ".R",sep = "") 
  MFile = paste(QuantletName, ".m",sep = "")
  
  lRFile = RFile %in% dir(sSubPathRoot, full.names = FALSE)
  lMFile = MFile %in% dir(sSubPathRoot, full.names = FALSE)
  
  QuantletList[iCounter, 1] = QuantletName
  if(lRFile){
    QuantletList[iCounter, 2] = "R"
  }
  if(lMFile){
    QuantletList[iCounter, 3] = "M"
  }
  iCounter = iCounter + 1
}