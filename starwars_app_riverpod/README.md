# App Info
Startwars App explore characters, startships, vehicles and homeworlds from the Starwars movie.


# Project Architecture and Structure
Fundamentally this app uses DDD(Domain Driven-Design) architecture which separate four layer of the app
- Application handle the business logic using Riverpod state management
- Presentation handle the core of the UI
- Domain handle entities and model
- Infrastructure handle remote data for API anda local remote data

# How to run the project
- Clone this project to your local
- from the root of project run "flutter pub get" or open pubspec.yaml and CMD+S for Mac or Ctrl+S for windows
- from the root of project run "flutter run"

# Key features
- Display a list of Star Wars characters. ✅
- Allow users to select a character from the list. ✅
- Display detailed information about the selected character ✅
- Confirm that the app can search for Star Wars character based on user input. ✅
- Ensure that the app handles API errors gracefully. ✅
- Handle No Internet connection from Splash Page ✅
- Caching Mechanism
  - Every Startship, Vehicle or Homeland will stored locally with a unique id and will remain on user phone until they kill the app. So other "People" detail can use it again wihout geting a new data from API.




