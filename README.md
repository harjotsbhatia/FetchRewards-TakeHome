# FetchRewards Desserts Application Documentation

## Overview

The FetchRewards Desserts application showcases a collection of desserts and their detailed recipes fetched from an external API. This document provides an overview of the application's architecture, including models, view models, views, and service layers, and outlines potential areas for future enhancements.

<div align="center">

| <img src="https://github.com/harjotsbhatia/FetchRewards-TakeHome/assets/89289963/1bdea5c7-0838-45d3-b826-4d3808a4c242"  height="400" />   | ![GIF 2024-02-03 at 14 52 59](https://github.com/harjotsbhatia/FetchRewards-TakeHome/assets/89289963/d6f437cd-6850-401e-a925-bbb4beb00b34)|
| --------------------------------------- | --------------------------------------- |

</div




## Models

### `DessertsModel.swift`

- **Purpose**: Defines structures for dessert items and responses from the API.
- **Components**:
  - `Dessert`: Represents a dessert with properties for identification, name, and a thumbnail image URL.
  - `DessertResponse`: Models the API response, encapsulating a list of desserts.

### `DessertDetails.swift`

- **Purpose**: Models detailed information about a dessert, including ingredients and instructions.
- **Components**:
  - `DessertDetailResponse`: Contains a collection of `DessertDetails` objects.
  - `DessertDetails`: Extends `Dessert` with additional details such as instructions and ingredients.
  - `Ingredient`: A simple structure for an ingredient, including its name and measurement.

## ViewModels

### `DessertDetailsViewModel.swift`

- **Purpose**: Manages the data logic for dessert details, including fetching and error handling.
- **Key Features**:
  - Asynchronous fetching of dessert details.
  - UI updates and error handling.

### `DessertsViewModel.swift`

- **Purpose**: Manages the data logic for the list of desserts, including fetching, sorting, and error handling.
- **Key Features**:
  - Asynchronous fetching and sorting of desserts by name.
  - Error handling with UI feedback.

## Views

### `DessertDetailsView.swift`

- **Purpose**: Provides a detailed view of a dessert, including its image, name, instructions, and ingredients.
- **Key Features**:
  - Dynamic image resizing based on scroll position.
  - Detailed listing of ingredients and instructions.

### `DessertsView.swift`

- **Purpose**: Displays a grid view of dessert thumbnails.
- **Key Features**:
  - Navigation to detailed dessert views.
  - Asynchronous data fetching with UI updates.

## Service

### `DessertService.swift`

- **Purpose**: Handles networking to fetch dessert data from the API.
- **Key Features**:
  - Generic fetch method for decoding JSON data.
  - Specific methods for fetching dessert lists and details.

## Potential Improvements

- **Caching**: Implement data caching for efficiency and offline access.
- **Enhanced Error Handling**: Provide clearer user feedback for errors.
- **UI Enhancements**: Add animations and interactive elements for a better user experience.
- **Testing**: Increase reliability with comprehensive unit and UI testing.
- **Pagination/Infinite Scrolling**: Improve performance and usability for large datasets.
- **Localization and Accessibility**: Support multiple languages and accessibility features.
- **Dietary Filters**: Allow filtering desserts based on dietary restrictions.
- **Favorites and History**: Enable users to mark favorites and view their dessert history.
