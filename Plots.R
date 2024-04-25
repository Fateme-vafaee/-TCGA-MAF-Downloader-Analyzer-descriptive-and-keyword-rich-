Plots=function(DataSet_Dir,DataSet_Names)
{
  memory.limit(size = 30000)
  if(!dir.exists("Outputs"))
    dir.create("Outputs")
  for(i in 1:length(DataSet_Names))
  {
    load(DataSet_Dir[i])
    maf=read.maf(maf = maf)
    #Loc=strsplit(DataSet_Dir[i],'.RData')[[1]]
    Loc=paste("Outputs/",DataSet_Names[i],sep = "")
    if(!dir.exists(Loc))
      dir.create(Loc)
    Loc=paste(Loc,"/",DataSet_Names[i],sep = "")
    #-------------Lollipop--------------------
    
    pngName=paste(Loc,'_lollipopPlot.png',sep = "")
    png(file = pngName, width = 1200,height = 500)
    lollipopPlot(maf = maf, gene = 'TP53', AACol = 'HGVSp_Short', refSeqID = 'NM_001126112')
    dev.off()
    
    pdfName=paste(Loc,'_lollipopPlot.pdf',sep = "")
    pdf(file = pdfName, width = 10,height = 5)
    lollipopPlot(maf = maf, gene = 'TP53', AACol = 'HGVSp_Short', refSeqID = 'NM_001126112')
    dev.off()
    #--------------PlotVaf--------------------
    
    pngName=paste(Loc,'_PlotVaf.png',sep = "")
    png(file = pngName, width = 1200,height = 500)
    laml.titv = titv(maf = maf, useSyn = TRUE)
    plotTiTv(laml.titv)
    dev.off()
    
    pdfName=paste(Loc,'_PlotVAF.pdf',sep = "")
    pdf(file = pdfName, width = 10,height = 5)
    laml.titv = titv(maf = maf, useSyn = TRUE)
    plotTiTv(laml.titv)
    dev.off()
    
    #---------------plotmafSummary----------------
    
    pngName=paste(Loc,'_plotmafSummary.png',sep="")
    png(file = pngName, width = 1200,height = 500)
    plotmafSummary(maf = maf, addStat = 'median')
    dev.off()
    
    pdfName=paste(Loc,'_plotmafSummary.pdf',sep="")
    pdf(file = pdfName, width = 10,height = 5)
    plotmafSummary(maf = maf, addStat = 'median')
    dev.off()
  }
}