# HealthInformation Application

## About
The HealthInformation application (HI) is a mobile application designed for the iOS operating system. This application will keep track of various medical information for the downloader. Information such as: dates, dosage amount, and information for prescribed medicine(s), medical card identification including health concerns and conditions, blood type, current medicine(s), address, etc... There will also be options to contact your local health provider on your behalf and refill prescriptions if running low. 

## Downloading and Running
In order to download our application please see our releases for incremental updating. <br/>
Since this is an iOS project, Xcode is required to preview the application in live time. <br/>
Please run all binaries and open the project in Xcode and make any edits you would like!

## Directory Information

### Health.xcodeproj and Health.xcworkspace
Health.xcodeproj corresponds to our application xcode project directory. Xcode tracks projects with xcodeproj files. Health.xcworkspace corresponds to the xcode workspace, normally for source control, these would not be important but since we are using podfiles(also known as cocoa pods) within our environment, the project needs both for all pod implementations to work!

### Pods
This directory contains all imported podfile source code. Our project used a lot of external libraries to automate functionality such as our calendar view and the sign in page!

### Shared
This directory contains all swift source code! 

### Podfile and Podfile.lock
This is the actual podfile, for easy access and readability we left it outside the "Pods" directory. 
Basically a standard format for handling/managing all external libraries. 
Podfile lock is used to ensure every team member contributing to the project is using the same version of pods!

## [Project Site](https://jxmils.github.io/HealthInformation/)
