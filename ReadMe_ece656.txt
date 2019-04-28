ECE 656 - Recommendation System
Saud Aslam (20751814) , Ahmad Nayyar Hassan(20742695)

We have implemented both the Decision Tree Classifier and Naive Bayes Predictor to predict the expected rating of a given user (identified by userid) to a given
business (identified by business id) on the Yelp data set.

An interactive GUI in python gives full control to the user on the client side through the following buttons and widgets:

Widgets

USER ID     : A specific user id is entered by the user

BUSINESS ID : A specific business id is entered by the user

Start Date  : A specific start date is entered to choose the starting date for the subset to be used for training

End Date    : A specific end date is entered to choose the ending date for the subset to be used for training

Buttons

Data Cleaning         : For all the sanity and integrity checks and cleaning of the data

Generate Train Table  : Ensures generation of the training set according to the user input values of start and end dates
 
Roll back             : To enter into the starting state of the data base

Exit                  : To exit the program

Training and Validation: Trains the classifier and tells the accuracy of the algorithm on the validation set

Expected Rating-DT    : Predicts the rating given by using Decision tree classifier

Naive Validator Rating: Validates/Predicts the rating given by using Naive Bayes Predictor


Summary:
1) Server/Client architecture implemeted with Server in MySQL and Client in Python
2) Server Side implements two Data Mining Algorithms : (a) Decision Tree Classifier (b) Naive Bayes Predictor
3) The Client allows :
   (a) Cleaning of Data   : Data Cleaning and Sanity,Integrity checks implementation (Data Cleaning Button)
   (b) Analysis of Data   : Prediction of rating through both the classifiers(Expected Rating-DT,Naive Validator Rating Buttons)
   (c) Validation Analysis: Validation accuracy of the classifier used(Training and Validation Button)
   (d) Undoing Choices    : Returns the data to the intial consistent state(Roll back Button)
   (e) Additional Choices : Data filters to select training data (Start and End Date Widgets)