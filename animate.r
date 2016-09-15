# Script for generating frames for a animation on danish population

# convert -delay 10 -loop 0 frame* befolkning.gif

IMAGEFILE = '~/tmp/frame%03d.png'
PLOTTITLE = 'Population, Denmark, %s'
# data1 <- read.csv("befolkningstal1901-1970.csv", head=TRUE, row.names = 1)
# For same reason All lables are prefixed with an X. 
#colnames(data1) = gsub("X","",colnames(data1))

data2 <- read.csv("befolkningstal.csv")

frameI = 1

maxcount =  max(data2, na.rm = TRUE)
originYear = 1970
for(i in 1:ncol(data2)){
	frameName = sprintf(IMAGEFILE, frameI)
	frameI = frameI + 1
	totalPopulation = sum(data2[,i], na.rm = TRUE)
	plotTitle = sprintf("Population, Denmark, %d 
Total Population: %d", originYear + i, totalPopulation)

	png(frameName)
	barplot(data2[,i], main = plotTitle, ylab = "Count", xlab ="Age", ylim=c(0,maxcount),
	 xlim = c(0,100), border = NA, space = 0, names.arg = 1:nrow(data2)-1)
	dev.off()
}
