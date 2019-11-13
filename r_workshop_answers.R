# workshop doc answers

# ngram question
JD_df %>%
  unnest_tokens(output = trigram, input = JD_capta, token = "ngrams", n = 3)

# tokenize by sentences
JD_df %>%
  unnest_tokens(output = sentence, input = JD_capta, token = "sentences")

# Tokenize with regex by chapter
chapters <- p_and_p %>%
  unnest_tokens(chapter, txt, token = "regex", pattern = "Chapter \\d+")

head(chapters, 7)

# Raw word count P&P
pride_count <- p_and_p %>%
  unnest_tokens(output = word, input = txt) %>%
  count(word, sort = TRUE)

# Converting to Relative frequencies and removing column
pride_count$rel_freqs <- 100*pride_count$n/sum(pride_count$n)
jd_count$rel_freqs <- 100*jd_count$n/sum(jd_count$n)

pride_count <- pride_count[-2]
jd_count <- jd_count[-2]

# calculating and plotting from ns and stem
p_count_ns_stem$rel_freqs <- 100*p_count_ns_stem$n/sum(p_count_ns_stem$n)
jd_count_ns_stem$rel_freqs <- 100*jd_count_ns_stem$n/sum(jd_count_ns_stem$n)

p_count_ns_stem %>%
  head(10) %>%
  mutate(word = reorder(word,rel_freqs)) %>% #reorders word frame by n
  ggplot(aes(word,rel_freqs),size = 7) +
  geom_col() +
  xlab(NULL) +
  theme_minimal()+
  coord_flip()

jd_count_ns_stem %>%
  head(10) %>%
  mutate(word = reorder(word,rel_freqs)) %>% #reorders word frame by n
  ggplot(aes(word,rel_freqs),size = 7) +
  geom_col() +
  xlab(NULL) +
  theme_minimal()+
  coord_flip()