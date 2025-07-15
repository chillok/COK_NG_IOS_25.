This repo contains an iOS coding challenge.

It's a simple MVVM-C SwiftUI app. 

- To run the project, just download it and open in Xcode 16.4+ (though likely works on earlier versions of Xcode 16).
- There are no external dependencies.

UI/UX:
- Home screen is a simple View with an embedded Search Bar and information banner.
- The search results are displayed below the search bar in the view itself. I've made one tweak from the challenge doc - adding a Search bar below the Navigation Bar breaks the fluidity of iOS UI, so I added it using the recommended SwiftUI controls.
- A user can tap the search result to display more details, or swipe to page through them. I have not added any pagination to API calls.
- The Details screen displays title, image, author(s), year and category.

Architecture:
- Using MVVM-C architecture, a standard MVVM but with a Coordinator. 
- We split the Coordinator in two to make it more testable. Using a Coordinator in SwiftUI presents a challenge in testing, since the navigation is handled by a View (with a NavigationStack), and we can't unit test the View very well.
- The two are:
  - SearchCoordinator, which manages where to go.
  - SearchCoordinatorView, which manages creating the view and going there.
- The rest of the flow is fairly standard. Each major View has a ViewModel, our views communicate through that and are updated when it changes.

Testing:
- Added tests to the SearchView ViewModel. I think testing the ViewModel is the most important as it manages that View. We've a test to ensure when a user searches that the WebService is hit.
- Added tests to the SearchCoordinator. This ensures after we seleect a book in the View Model that the cordinator sets the path for the Book Detail.
- Added tests to the Webservice. Subclassed the actual WebService so that we fetch from disk rather than use URLSession.
- Added misc tests to common code.
- Tried to add UI tests, using Xcode's internal tools - but it's throwing an error! Even though all that code is generated from using the Simulator. Not sure the cause so disabled that test.

Error Handling:
- Added Error messages to failed URL requests.

Provide explanations for any items you couldn't accomplish within the given timeframe:
- The UI animation actually seems a bit choppy when activating the search bar and also when opening some results. I'm not sure the cause or maybe it's how SwiftUI handles that. I think asynchronous image loading of different sizes is probably causing that. In general I would have liked to spent more time polishing the UI but it was more important to get the technical bits in first.
- I'd like to have added tests to SearchCoordinatorView. They'd have to be UI tests and I'd have needed to have the app use Mock data for test consistency.
- The API isn't paginated. Just not enough time.
