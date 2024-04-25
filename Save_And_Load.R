Save_Load=function(folder_name,DataSet_Names)
{
  if(folder_name=="Input")
  {
    dir.create("Input")
    dir.create("Input/Maf")
  } 
  if(folder_name=="Input/Maf")
    dir.create("Input/Maf")
  
  dir_name="Input/Maf/";
  DataSet_FullPath="dir"
  for(i in 1:length(DataSet_Names))
  {
    MainDir=paste(dir_name,DataSet_Names[i],sep = "")
    Maf_Data_Name=paste(DataSet_Names[i],'_M',sep = "")
    RDate_Data_Name=paste(DataSet_Names[i],'_M.RData',sep = "")
    DataSet_FullPath[i]=paste(MainDir,"/",RDate_Data_Name,sep = "")
    
    if(!dir.exists(MainDir))
    {
      dir.create(MainDir)
    }else{ 
      if(file.exists(DataSet_FullPath[i]))
        next
    }
    
    maf <- GDCquery_Maf(DataSet_Names[i], pipelines = "muse")
    save(maf,file=DataSet_FullPath[i])
    
  }
  return(DataSet_FullPath)
}
