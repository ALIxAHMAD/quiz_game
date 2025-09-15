# Quiz Game 🎯

A Flutter quiz game with **Clean Architecture**, **Test-Driven Development (TDD)**, and a **beautiful, easy-to-use UI**.  
Players can choose their trivia **category**, **difficulty**, and **number of questions**.  

The app fetches live trivia questions & categories from [OpenTDB](https://opentdb.com/) using the **Dio HTTP client**.

---

## Features
- Choose from multiple **trivia categories**  
- Select question **difficulty levels** (easy / medium / hard)  
- Set custom **number of questions** per game  
- Live data from OpenTDB API  
- **Score tracking** at the end of each game  
- **Clean Architecture** & **TDD**  
- Simple, responsive UI with smooth navigation

---

## Screenshots
<table>
  <tr>
    <td><img src="assets/screenshots/screen1.png" width=318  height=552></td>
    <td><img src="assets/screenshots/screen2.png" width=318  height=552></td>
    <td><img src="assets/screenshots/screen3.png" width=318  height=552></td>
  </tr>
 </table>

---

## Tech Stack
- **Flutter** (cross-platform)  
- **Cubit** for state management  
- **Dio** for HTTP client  
- **Clean Architecture** (Domain / Data / Presentation layers)  
- **Test-Driven Development**   

---

## Architecture Overview
**Domain Layer**  
- Entities: `Category`, `Question`  
- Repository: `TriviaRepository`  
- Use Cases: `GetCategories`, `GetQuestions`  

**Data Layer**  
- Repository Implementation: `TriviaRepositoryImpl`  
- Models: `CategoryModel`, `QuestionModel`  
- Data Source: `TriviaRemoteDataSource`  

**Presentation Layer**  
- Pages: `HomePage`, `QuestionsPage`, `ScoresPage`  

---

