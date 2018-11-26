library(bigrquery)
library(knitr)
library(DBI)
library(ggplot2)
library(dplyr)
library(purrr)
library(tidyr)

conn <- dbConnect(bigquery(), project = "", dataset = "", 
                  use_legacy_sql = FALSE)

create_sql <- function(metric){
	sql <- paste("select ... from ...", " where type = '", metric, "' group by 1")
	return(sql)
} 

sql_metric1 <- create_sql(metric1)
df_metric1 <- dbGetQuery(conn,sql_metric1)
df_metric1_clean <- df_metric1 %>% mutate() %>% filter()

ggplot(df_metric1_clean , aes(var1)) +
  geom_histogram()+
  facet_wrap(vars(var2), scales = "free")

sql_metric2 <- create_sql(metric2)
df_metric2 <- dbGetQuery(conn,sql_metric1)
df_metric2_clean <- df_metric2 %>% mutate() %>% filter()

ggplot(df_metric2_clean , aes(var1, var3)) +
  geom_point()+
  facet_wrap(vars(var2), scales = "free")  