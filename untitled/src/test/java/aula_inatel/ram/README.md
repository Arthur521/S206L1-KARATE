# README - Tests for a Rick and Morty API using Karate

## Overview

This repository contains a test suite written in [Karate](https://github.com/intuit/karate) for testing the Rick and Morty API. Karate is a powerful open-source tool for testing APIs.

## Requisites

- [Java](https://www.java.com/en/download/)
- [Maven](https://maven.apache.org/download.cgi)

## Karate Installation

If you are new to Karate or need help installing it, I recommend watching this video here [Setting up Karate Framework on IntelliJ IDEA](https://www.youtube.com/watch?v=-KOJ12Dbxrk). This tutorial provides step-by-stepon how to set up Karate for your projects with Intellij IDEA.

## Test Scenarios

### 1. Testing response

- **Given:** Set the API endpoint URL to 'https://rickandmortyapi.com/api/character/3'.
- **When:** Perform a GET request.
- **Then:** Ensure the response status is 200.

### 2. Testing response with invalid information

- **Given:** Set the API endpoint URL to 'https://rickandmortyapi.com/api/character/1000'.
- **When:** Perform a GET request.
- **Then:** Ensure the response status is 404.

### 3. Testing response and verifying JSON

- **Given:** Set the base URL to 'https://rickandmortyapi.com/api/' and the path to '/character/1'.
- **When:** Perform a GET request.
- **Then:** Ensure the response status is 200.
- **And:** Verify that the response contains the correct character name and ID.

### 4. Testing location data response

- **Given:** Set the base URL to 'https://rickandmortyapi.com/api/' and the path to '/location/1'.
- **When:** Perform a GET request.
- **And:** Extract the URL of a resident.
- **Then:** Ensure the response status is 200.
- **And:** Verify that the extracted resident URL is correct.

### 5. Testing response with invalid information

- **Given:** Set the base URL to 'https://rickandmortyapi.com/api/' and the path to '/location/300'.
- **When:** Perform a GET request.
- **Then:** Ensure the response status is 404.

### 6. Testing episode data response

- **Given:** Set the base URL to 'https://rickandmortyapi.com/api/' and the path to '/episode/3'.
- **When:** Perform a GET request.
- **And:** Extract the URL of a character from the response.
- **Then:** Ensure the response status is 200.
- **And:** Verify that the extracted character URL is correct.

## Reporting

Karate generates reports that can be found in the `target/karate-reports/res` directory after running the tests. Open the HTML file in a browser to view the test results.

---
