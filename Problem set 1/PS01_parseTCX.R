# 2. Write pseudo code to extract the altitude and distance along the track

# Solution description: By opening the file in the web browser, I can see that 
# there is only 1 Track node (<Track>...</Track>) by using Ctrl + F to search.

# Inside the track are track point nodes, which contain information about the
# altitude and distance via the AltitudeMeters and DistanceMeters nodes, respectively.

# Therefore, I will locate the Track node directly instead of searching for it 
# in the big xml tree, and then extract information about altitude and distance
# from each track point.

# Pseudo code:
# Input: Get a collection of all the track point nodes in the track node 
# by locating the track node directly (should be 
# TrainingCenterDatabase -> Courses -> Course -> Track)

# Create a altitude list to store altitude values.
# Create a distance list to store distance values.

# Go through each track point node in the collection:
  # Extract information about the altitude in the track point node.
  # Extract information about the distance in the track point node.

  # If there is information about the altitude, put that value in the altitude list
  # Else, put an empty record in the altitude list.
  # End if condition

  # If there is information about the distance, put that value in the distance list
  # Else, put an empty record in the distance list.
  # End if condition
# End loop

# Create a result list and put the altitude list and the distance list into it.

# Output: Return the result list. 

# Note: This will ensure that the altitude list and the distance list have the same length 
# despite there might be no altitude or distance in a track point at some point, 
# allowing us to later put them into a data frame in R for exploration purposes 
# or to perform other analyses.