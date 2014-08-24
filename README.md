<h2>Description of the script "run_analysis.R"</h2>

<h5>How to execute the script</h5>
In order to run the script properly, your working directory has to be set to the folder path of "UCI HAR Dataset" of the downloaded data set. The script will return a file called "average_table.txt" which contains a selection of features averaged by subject and activity. For a full description of the selected features and the data set please refer to the codebook.MD

<br>

<h5>Steps performed by the script:</h4>
1. The training and test sets are loaded from the raw data files "train/X_train.txt" and "test/X_test.txt". At this point the features are not properly named.<br> 
2. The names are updated by loading the feature names from the file "features.txt" and assigning them to the appropriate columns in the test and training data set. <br>
3. The subject identifiers are loaded from the files "train/subject_train.txt" and "test/subject_test.txt and added as a column with the name "subject" to the test and the training data set.<br>
4. A data set which maps activity numbers to descriptive names is loaded from "activity_labels.txt". The loaded table is merged with the training and test set in order to obtain a descriptive labeling of the activities. The column name which contains the descriptive activities is named "activity".<br>
5. The training and test set are merged. As they contain the same number of columns with identical naming and meaning, the two sets are simply bound to each other using rbind() resulting in the table "X_combined"<br>
6. In order to downselect only features which represent a mean or a std statistic of a feature, the column names are filtered using the grepl function to identify columns which contain the character strings "mean()" and "std()". These columns and the subject and activity columns are forming the new data set "X_subset"<br>
7. The averaging of the selected features by subject and activity is done using the ddply function of the library plyr. The resulting data table is named "average_table". The averaged features are names according to the sequence "average("<original feature name>")" to identify these new variables as averages.<br>
8. The resulting data table "average_table" is saved as "average_table.txt", excluding row names.<br>


