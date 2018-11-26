library(bigrquery)
library(knitr)
library(DBI)
library(ggplot2)
library(dplyr)
library(purrr)
library(tidyr)

conn <- dbConnect(bigquery(), project = "", dataset = "", 
                  use_legacy_sql = FALSE)
sql <- "select ... from ..."

df <- dbGetQuery(conn,sql)

df_clean <- df %>% mutate() %>% filter()

ggplot(df_clean , aes(var1)) +
  geom_histogram()+
  facet_wrap(vars(var2), scales = "free")