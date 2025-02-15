library(tidyverse)

# Create a tibble containing information about riders registered
# for the 2024 Midnight Sun Randonnée.
MSR2024riders <- read_tsv('MSR2024riders.tsv')
view(MSR2024riders)



# 1a. Write pseudo code for modifying the last names, first names, club names, 
# and city names.

# Solution description: We will capitalize the first letter of the first word 
# in the name, or any letter that follows a non-letter character/symbol 
# (e.g., a space ' ', a dot '.', a hyphen '-', etc.).

# Examples:
# "BRIOT JEAN-PAUL" is expected to be "Briot Jean-Paul"
# "Saint-OUEN-sur-Seine" is expected to be "Saint-Ouen-Sur-Seine"
# "Club e.V." is expected to be "Club E.V."

# Pseudo code:
# Input: Receive a collection of all the names from a specific column (can be 
# last name, first name, club name or city name column).

# Go through each name in the collection:
  # Create a flag to check if the next character should be capitalized, and 
  # enable the flag as default status.

  # For each character in the name:
      # If the character is a letter:
          # If the flag for capitalizing the character is enabled:
              # Capitalize the letter and disable the flag.
          # Else, just lowercase the letter.
          # End if condition.
      # Else, enable the flag for the next character check.
      # End if condition.
  # End loop.
# End loop.

# Output: Return the name after finishing the modifications.



# 1b. Write pseudo code for correcting the duplication of the country names

# Solution description: Because the country name is duplicated, we simply 
# cut it in half and pick either the first or second half. I will pick the
# first half and return the result.

# Pseudo code:
# Input: Get the input country name.

# Find the middle position, which is half the length of the input country name.
# Extract the sub-string that starts from the first character up to the character 
# at the middle position of the input country name.

# Output: return the sub-string which is the correct country name.
