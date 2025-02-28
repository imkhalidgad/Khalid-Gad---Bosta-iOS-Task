
## Overview

In this simple task, we’re evaluating your coding style and design patterns.
The app is composed of 2 screens, first is the profile screen, it has the user
name and address pinned at the top and then it lists all of this user’s albums. You
can get user albums by requesting the albums endpoint and passing userId as a
parameter.
When you press on any album it navigates to the second screen which is an
album details screen. You request the photos endpoint and pass album id as a
parameter, then list the images in an Instagram-like grid. Also, there should be a
search bar that you can filter within the album by the image title, when you start
typing the screen should show only images that are related to this search query.

---
The app allows users to:
- Browse albums and view images.
- Zoom into images for better clarity.
- Search images by name or tags.
- Share images via the native iOS share sheet.


---
## Project Screens

<p align="center">
  <img src="https://j.top4top.io/p_3246sf0ud1.png" alt="Album List Screen" width="200">
  <img src="https://k.top4top.io/p_3246xe61r2.png" alt="Album Details Screen" width="200">
  <img src="https://l.top4top.io/p_3246nskrx3.png" alt="Search Feature" width="200">
</p>

<p align="center">
  <img src="https://a.top4top.io/p_3246adlzp4.png" alt="Image Viewer" width="200">
  <img src="https://b.top4top.io/p_3246p0wkb5.png" alt="Zoom" width="200">
  <img src="https://c.top4top.io/p_3246uy6wd6.png" alt="Share Feature" width="200">
</p>

## Features

- **Album View**: View images grouped in different albums.
- **Image Zooming**: Pinch-to-zoom functionality on images for a detailed view.
- **Search Functionality**: Filter images within albums by search text.
- **Image Sharing**: Share images directly using the iOS share sheet.
- **MVVM Architecture**: Structured code with separation between UI and business logic.
- **Combine**: Reactive framework to handle state and data-binding efficiently.
- **CombineCocoa**: Extend UIKit components with reactive bindings.
- **Moya**: Handles network requests with a clean, structured API layer.

---

## Technologies Used

- **Swift**: The main programming language used for development.
- **UIKit**: Framework used for building the user interface.
- **XIB**: For designing view controllers using Interface Builder instead of Storyboard.
- **Combine**: Used for reactive programming, managing states, and binding data.
- **CombineCocoa**: Provides reactive extensions for UIKit components.
- **MVVM**: The Model-View-ViewModel architecture to ensure a clean and testable codebase.
- **Moya**: A network abstraction layer to simplify and organize network requests.
---
### Requirements
- iOS 13.0 or later
- Xcode 13.0 or later
