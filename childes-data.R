# Load packages
library(tidyverse)
library(childesr)

# Retrieve parental utterances from the Thomas corpus 
thomas <- get_utterances(collection = "Eng-UK",
                         corpus = "Thomas",
                         role = c("Mother", "Father")) %>%
  select(utterance = gloss) %>%
  filter(!(str_detect(utterance, "xxx"))) %>%
  filter(!(str_detect(utterance, "yyy"))) %>%
  filter(!(str_detect(utterance, "www"))) %>%
  filter(!(str_detect(utterance, "not transcribed"))) %>%
  filter(utterance != "") %>%
  mutate(utterance = tolower(gsub("[^a-zA-Z ]", "", utterance))) %>%
  write_csv("thomas.csv")
