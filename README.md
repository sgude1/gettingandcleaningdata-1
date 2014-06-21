INSTRUCTIONS
============

The following are the instructions for running the script run_analysis.R in order to get the tidy Data Set proposed by the course Getting and Cleaning Data (John Hopkins School for Public Health)

##Setting the working directory

* It is needed to download the raw data with which we are going to work with. The raw data is available through the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The data must be uncompressed into the working directory selected by the user.
* The R script <b>run_analysis.R</b> (https://github.com/jmova/gettingandcleaningdata/blob/master/run_analysis.R) must be copied to the working directory. (The same directory where the uncompressed raw data is.)

##Running the script

* Run the script in the terminal or RStudio using the command <b>source("run_analysis.R")</b>
* Wait for the script to execute. 

<b>(!)NOTE: Calculations coult take some minutes depending on the machine you're using.</b>

##RESULTS

* Once the script has finished, a directory called <b>RESULTS</b> is created inside the working directory.
* The tidydataset will be loaded into the R environment under the name <i>ucihar</i>.

The directory <b>RESULTS</b> will contain:

* A file called <b>tidyDataSet.txt</b> containing the tidy dataset needed for the assignment.
* A file called <b>moreData.txt</b> containing more data also in a tidy format.

<b>(!)NOTE: The datasets have been written to the hard disk due to the hard processing load so it's easier to check again the datasets without running again the script.</b>

##Reading the results

* The <i>.txt</i> files created containing the tidy dataset can be easily loaded into R using the function <b>read.csv()</b>




