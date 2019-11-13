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