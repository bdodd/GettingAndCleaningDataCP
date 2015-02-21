ReadMe
========
The R file "run_Analysis.R" converts the raw data into two tidy data sets.

###Importing the data
The script begins by importing the name of the feature variables from the "features.txt" file.<br/>
Data from the test and training folders is imported in several steps.<br/>
- Import the subject names.  A column name of "SubjectID" is added to make the df more informative.<br/>
- Import the y data.  A column name of "Activity" is added to make the df more informative<br/>
- Import the x data<br/>
The feature variables are added as the column names of the y data to make the df more informative.<br/>
<br/>
To get a df of variables dealing with means and standard deviations several steps are performed:<br/>
- Create a df that contains those variables (column names) containing "mean"<br/>
- Create another df that contains those variables (column names) containing "sd"<br/>
- Create a new df composed of the above two df.<br/>

###Combining the data
There are three df for the test and train data sets.<br/>
For the test data, the three data frames are combined using cbind().<br/>
This process is repeated for the training data.<br/>
The resulting two df are combined using rbind() to create the final data set.<br/>

###Altering the data
The "Activity" column is currently numeric which isn't particularly informative.<br/>
Based on the "activity_labels.txt" file the "Activity" column is converted to factors with appropriate lables.<br/>

###Getting the averages (part 5)
The final part of the script relies on the dplyr package.<br/>
The final data frome from above is grouped by "Activity" and "SubjectID".<br/>
The "summarise_each()" function produces a new df where a new entry is created that is the mean of each variable for each "Activity" and "SubjectID".<br/>
That returned df is exported as a txt file.
