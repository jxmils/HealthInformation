<p align="center">
    Architecture 
</p>

## Overview
The Health Information application will enable the user to make medical decisions effortlessly and quickly. It allows for easy access to doctor and health office information, and user health information through a printable medical ID.

### Key Architectural Drivers
* The architecture must support interactive interfaces.
  * We implemented a portable user interface using SwiftUI and xcode. Which will be available for iOS devices.
* The architecture must be feature oriented.
  * The user is able to input and output information. This information can include the creation, editing and deletion of medical appointments and prescriptions.
* Store user data
  * We will be inputting many user information including medical office and patient data.
* Methods need to be tested quickly.
* Reduced dependency.

### Style Choices
1. Publish and Subscribe
* Reasononing:
  * Supports interfaces, action from the user needs to be heard, in order to perform actions in the app.
  * Events are necessary to follow what the user want to do within a certain page of the app.
2. Layered
* Reasononing:
  * Easy implementation and understanding.
  * Reduced dependency since each layer is independent of each other. 
  * Testing is easier, components can be tested individually.
We decided to proceed with the layered architecture.

### Layered Implementation
Initially, we were having issues testing the system as a whole. We decided to break it up into smaller pieces as you do with any computer science problem. This made it easier to implement the system and let us test the methods and functions independently from each other. We believed it would be the easiest to maintain without having as many problems as we were beforehand. <br>

<p align="center">
    <img src="https://github.com/jxmils/HealthInformation/blob/gh-pages/layered.png" alt="Layered Architecture Diagram" style="height: 512px; width: 512px;"/>
</p>


### Conclusion
Switching to the layered pattern helped tremendously with piecing together our seperate methods. Knowing each method can work independently can save a lot of time trying to pinpoint which function was causing errors when testing the system as a whole. This implementation was best for our application.
