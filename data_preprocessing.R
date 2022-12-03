#Data preprocessing for shiny assignment
library(tidyverse)
library(readxl)

foreign_student <- read_excel("foreign_students_by_nationality_2021_2022.xlsx")

#Rename columns for turkish characters
column_names <- foreign_student %>% colnames() %>% gsub(" ","_", .)
colnames(foreign_student) <- chartr("Ü ü ı İ","U u i I",column_names)

#Last column is the total values of the coloumns for male and female students
foreign_student <- foreign_student %>% head(-1)

#There is no NA value so there will be no process according to that. 

#Convert numeric values -> integer format for better analysis
foreign_student <- type.convert(foreign_student, as.is=TRUE)


#Convert to rds format for shiny app processing
saveRDS(foreign_student, "Shiny app assignment/foreign_students/data_foreign_students.rds")
