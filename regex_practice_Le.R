library(tidyverse)
library(babynames)


# How many unique baby names are in the data set?
unique_babynames <- unique(babynames$name)
paste("1. The number of unique baby names in the data set is",
      # Count the number of elements in the vector
      length(unique_babynames))


# Sort the names alphabetically
sorted_babynames <- babynames %>%
  arrange(name)


# What is first name, alphabetically?
paste("2. The first name alphabetically is",
      # Get the first row, shorthand for head(data, n = 1, ...)
      first(sorted_babynames$name))


# What is last name, alphabetically?
paste("3. The last name alphabetically is",
      # Get the last row, shorthand for tail(data, n = 1, ...)
      last(sorted_babynames$name))


# What is the first year that a female baby was named Taylor?
female_taylor_babynames <- babynames %>%
  # Find names equal "Taylor" and sex is "F"
  filter(name == "Taylor", sex == "F") %>%
  # Sort by year ascending
  arrange(year)

paste("4. The first year that a female baby was named Taylor is",
      # Get the first row
      first(female_taylor_babynames)$year)


# How many names contain either 'z' or 'Z'?
z_or_Z_babynames <- babynames %>% filter(str_detect(name, "[zZ]"))
paste("5. The number of names contain either 'z' or 'Z' is",
      # Count the number of elements in name vector
      length(z_or_Z_babynames$name))


# How many names contain both 'z' and 'Z'?

# Note: If both 'Z' and 'z' are present, 'Z' is always placed at the beginning 
# of the name.
z_and_Z_babynames <- babynames %>% filter(str_detect(name, "Z.*z.*"))
paste("6. The number of names contain both 'z' and 'Z' is", 
      # Count the number of elements in name vector
      length(z_and_Z_babynames$name))


# On a recent flight to Nashville, a female member of the cabin crew, probably 
# in her mid-twenties, had 'Zy' on her nameplate. Find plausible names that 
# have 'Zy' as a diminutive (a nickname).

# Note: From  my understanding, the names should start with 'Zy' to be 
# considered as a nickname because, for example, it’s unclear if Nazya can be 
# shortened to Zy as well.

# Search for names begin with "Zy"
Zy_babynames <- babynames %>% filter(str_detect(name, "^Zy"))
# Get the unique names
unique_Zy_babynames <- unique(Zy_babynames$name)
paste("7.1 The number of unique plausible names that have 'Zy' as a diminutive",
      "(a nickname) is",
      # Count the number of unique 'Zy' nicknames
      length(unique_Zy_babynames))
paste("7.2 First 5 names from the list:", head(unique_Zy_babynames, n = 5))


# Pick a name that has two spellings for one sex (e.g., Sean and Shaun)
# or a name that members of either sex might have (e.g., Taylor).  Create
# a graph showing the frequency of each name over time.  Apply the
# principles of effective graph design you've learned in Data
# Visualization to polish your graph.  Use comments to associate each
# change you make to the default ggplot theme with the principle that
# inspired it.

paste("8. A name that has two spellings for female: Emily and Emilie")

two_spelling_names <- babynames %>%
  # Filter female names equal Emily and Emilie
  filter(name == "Emily" | name == "Emilie", sex == "F") %>%
  mutate(percentage = 100*prop)

plot <- ggplot(two_spelling_names, aes(x = year, y = percentage, color = name)) +
  # Use line graph
  geom_line() +
  # Add text to identify which line corresponds to each name
  geom_text(data = filter(two_spelling_names, year == max(year)),
            aes(label = name),
            hjust = 0,
            vjust = -0.9,
            size = 2.5) +
  # Add graph title
  labs(title = "Proportion of the names Emily and Emilie over time") +
  # Use theme classic
  theme_classic() +
  theme(
    # Hide the legend
    legend.position = "none",
    # Adjust graph title text size, font weight and margin
    plot.title = element_text(size = 11, 
                              face = "bold",
                              margin = margin(b = 10)),
    # Increase the text size on both axes
    axis.text = element_text(size = 9),
    # Hide the title texts on both axes
    axis.title = element_blank()
  )

plot

# Save the graph as my desktop size
ggsave("emily-emilie-plot.png", 
       plot = plot, 
       width = 1920, 
       height = 1080, 
       units = "px")
