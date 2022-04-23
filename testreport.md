# Test Report

## Component Testing
The unit testing is divided into four parts in our system, which are the log-in interface, Calendar, Doctor’s Information, and Medication. Each of us mainly focuses on one part then integrated into the whole system. For example, in Doctor’s Information testing, two folders were created, one is mac os x, another one is the code. After this part’s testing is complete, it successfully builds the project, for this part only. Then it can combine with other parts and run together. We chose X code for the system to test the data because it is very simple to use, and you can see the results once you finish editing the code. It is convenient since the example running results just on the right-hand side of the screen. It’s easy to compose all the data together. It covered the expected requirements by handling the test data and all the tests correspondingly, as well as ensuring the template is in the correct order.


## System Testing
In order to test out the system, the app should take in bad and good data. For the good data, the user can input their email and password and should bring them to their account in the app. For bad data, the user should input invalid data such as a username instead of an email address and having the wrong password. The app should not allow the user to access an account that has incorrect credentials nor one that doesn’t exist. This was the right way in testing the code because that is the first action that the user will do to use the app, logging into it. The tools used for this was the database provided by Firebase and a user that had already been created.

Describe the system testing that you did that validated if features were considered accepted by the user. Describe how you used the acceptance criteria on your user stories to drive your system testing. List your user stories (title only) and state whether or not they are accepted as completely implemented, or not.
## Acceptance Testing
In order to conduct acceptance testing, we had to validate to ensure we accepted some of the user stories into our application. This test was conducted on a pass or fail test, no partial acceptance. 

### 1.1 Edit in App
This was passed, as we did implement a form to edit the information in a spreadsheet format.

### 1.2 Editing Externally
This implementation was accepted and passed. We have an application view where the user could internally edit and input information.

### 1.3 Information Privacy
This was indirectly passed, theoretically it is extremely hard to crack core data, the database in which we store all our information.

### Uploading Information
We are still attempting to figure out a way to do this. Therefore, for now, Fail.

### 2.2 Succesfully Storing Prescription Data
As a team, we felt this would take a really large amount of time to implement such a small impact feature. Fail.

### 2.3 Printing of Information
This was a really cool feature we wish we had time to implement, but could not. Fail.

### 3.1 Functionality Issue
Pass! We ended up merging all our view windows so now we have a home page to cause less issues.

### 3.2 Refill Page
We have not implemented this yet as this would take a large amount of time, still trying. Fail.

### 3.3 Calendar Functionality
This took some time to try to implement, we tried to make an external document tool but failed. Fail.

### 3.4 Calendar
This was actually succesfully implemented and now the user can see all their prescription information on the calendar as a event. Pass!

### 3.5 Doctor inteface
We did try to implement this but ended up doing it as an input feature. Pass!
