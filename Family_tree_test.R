library(kinship2)
library(rio)
library(tidyverse)
#KinshipPackage Documentation
#https://cran.r-project.org/web/packages/kinship2/vignettes/pedigree.pdf

data(sample.ped)
View(sample.ped)
sample.ped$ped

#load data from csv (declare your path here with forward flashes)
#see sample data for the required format
dat <- import("/Users/Sam/Documents/Programming/pedigree tree/Familytree_testdata.csv") %>% 
  filter(is.na(id)==FALSE)
dat <- dat %>% mutate(first_name = str_replace(name," .*",""))
#dat %>% mutate(father = str_replace(name,0,NA)) %>% mutate(mother = str_replace(name,0,NA))
#str(dat)
View(dat)

# make pedigree object
pedAll <- pedigree(
  id = dat$id,
  dadid = dat$father,
  momid = dat$mother,
  sex   = dat$sex,
  famid = dat$ped
)
print(pedAll)
ped2basic <- pedAll['2']
print(ped2basic)
plot(ped2basic, id=dat$name)

# plot and save pdf file
pdf("output_test.pdf", width=20, height=10)
plot(ped2basic, id=dat$name)
dev.off()
