library(maftools)
library(TCGAbiolinks)

DataSet_Names=c('ACC','SARC','BRCA','UCEC')

folder_name="init"
if(!dir.exists("Input"))
{
  folder_name="Input"
}else
  if(!dir.exists("Input/Maf"))
    folder_name="Input/Maf"

source("Save_And_Load.R")
DataSet_Dir=Save_Load(folder_name,DataSet_Names)

source("Plots.R")
Plots(DataSet_Dir,DataSet_Names)

source("Markdown_Report.R")
Markdoun_Report()