# list_interface
   This app initially was made to implement different types of views and then filling them with data whether from an api or a firebase container.


## Change log
   - 17 Jun 2024
      - I'll just upload this, since it's been a while since I haven't do anything here, but can't remember if made any advances after last note, anyway I need to upload this to git and use it in another computer.

   - 15 May 2024 
      ### 13:29 hrs
      - RyMCharacterList widget added, at the moment it loads the information on a ListView, later I'll define a design to load the data and let the user choose between character, episode or location view/section, **also I need to implement the loading of the info only on required widgets** (as I tried to do at the beggining, let's see what happens).

   - 14 May 2024 
      ### 18:08 hrs
      - Some trouble with maps but the info has finally got!

      ### 15:08 hrs
      - Added RickMortyRepository provider to main_rym.dart.
      - Added/initialized RymProvider in HomeRM.

      ### 13:04 hrs
      - added pending documentation to changelog xD
      - updated old documentation
      - ready to apply git init to the project and upload to github
      - by the end of the day i'll have to at least generate the code to execute the app and see if the api getter is working fine or make some corrections.

   - 13 May 2024
      - rick_morty_api created, also added 1st get corresponding to the same method in the repository.
      - rym_repo_impl created, and generated current available methods (according to repository and api).
      - IN SHORT FUTURE MAYBE I'LL SPLIT THE REPOSITORIES AND API METHODS ACCORDING TO IT'S DATA TYPE/ORIGIN PROVIDED BY THE API (CHARACTER, EPISODE, LOCATION)

   - 12 May 2024
      - HttpRequestFailure will be recycled.
      - rym_state created, all states added.
      - rym_repository created, and all methods added, but at the moment only one is active in order to check if the whole structure and connection to api will work fine.
      - rym_provider is also ready to be created since it only needs repository method defined, failure class, and states to be already created/defined.
      erated 1st method related to api and repository.

   - 11 May 2024
      - main_rym.dart created, this will be our new main exclusively for our Rick & Morty api comsumption.
      - home_rm and rm_body created.
      - Refactor on presentation/pages, now rick_morty folder will hold or home and other pages & widgets.
      - Begin R&M structure generation:
         - full models added and generated (freezed)

   - 09 May 2024
      - App modified in order to enable Functional Main App to receive home view as a parameter, and also givin a title for the appBar as a received parameter.
      - R&M Structure added (models, repo, implementation, api, states, provider) they're empty yet but ready for next step

   - 06 May 2024
      - Added dependencies: json_serializable, json_annotation (in order to consider using json_serializable with freezed in the future)
      - Started consimng Rick & Morty API 

   - 04 May 2024
      - Lots of no documented changes PLUS:
      - Web socket added.
      - Functional first refactor to code done.

   - 25 Apr 2024 
      - App splitted into imperative|functional folders.
      - build_runner && freezed, freezed_annotation pkg added.
      - providers/home/home_state.dart.

   - 23 Apr 2024
      - Imperative programming 
      - home.dart file to add crypto vertical views.
      - Domain/models/providers folder added.
      - GET READY TO SWITCH TO FUNCIONAL PROGRAMMING.

   - 20 Apr 2024
      - verticalViews modifide in order to load the data from the api, depending on its respose state.
      - crypto.dart added in order to keep a simplier and clearer view of the code working directly with coincap api.

   - 16 Apr 2024
      - home modifided, to implement reading of repository and also load the data from the api through the HomeProvider init() method.
   
   - 12 Apr 2024
      - HomeProvider added.
      - home.dart added, at this point is a copy of home_page.dart

   - 08 Apr 2024
      - Providers folder moved from presentation to domain folder.
      - Exchange repository and api created.
   
   - 06 Apr 2024
      - Responses, models & state class added.
      - http & provider packages added.

   - 02 Apr 2024
      - App created.
      - Clear architecture folder structure setted (data, domain & presentation)
