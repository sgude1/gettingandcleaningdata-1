#General Information

The initial datasets (available at:)  were based on the data obtained from 30 volunteers carrying a mobile phone while performing six different activities listed as:
* Walking
* Walking upstairs
* Walking downstairs
* Sitting
* Standing
* Laying

The sensor (accelerometers and gyroscopes) have been capable of measuring 562 different features. More details about these features can be found under the file <b>features_info.txt</b> and a comprehensive list of them in the <b>features.txt</b> both files included in the raw data.

#Files included in the original dataset
<b>(!)Note: this is information has been obtained from the README file embedded in the original dataset.</b>
The files included in the original dataset are the following:
* <b>README.txt</b>
* <b>features_info.txt</b>: Shows information about the variables used on the feature vector.
* <b>features.txt</b>: List of all features.
* <b>activity_labels.txt</b>: Links the class labels with their activity name.
* <b>train/X_train.txt</b>: Training set.
* <b>train/y_train.txt</b>: Training labels.
* <b>test/X_test.txt</b>: Test set.
* <b>test/y_test.txt</b>: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* <b>train/subject_train.txt</b>: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* <b>train/Inertial Signals/total_acc_x_train.txt</b>: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* <b>train/Inertial Signals/body_acc_x_train.txt</b>: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* <b>train/Inertial Signals/body_gyro_x_train.txt</b>: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#Treatment of the data
The details for the processing of the data can be found at the R script <b>run_analysis.R</b> availabe at this very repo.
The general steps have been:
* Loading the dataframes <b>X</b>, <b>y</b> and <b>subject</b> for both the train and test sets.
* Binding those dataframes by column in one dataset.
* Binding the resulting datasets by rows in one unique dataset.
* Extracting only the information related with the <i>mean</i> and the <i>standard deviation</i>.
* Creating and independent dataset with the average of each variable for each activity and each subject.
* Creating a <b>RESULTS</b> directory inside the working directory and writing the resulting dataset (named <i>alter</i>) to the hard disk under the name of <b>tidyDataSet.txt</b>.

#Variables used after processing
* id: Numbers from 1 to 30 identifying the subject performing the activities.
* activity: Activity performed by the subject out of the six possible measured activities.
* Features related with the <b>mean</b> and <b>standard deviation</b>. The original experiment names detailed at <b>features.txt</b> have been preserved.
