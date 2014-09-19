Core Data
=========

The Core Data framework provides generalized and automated solutions to common tasks associated with object life-cycle and object graph management, including persistence. There are a number of reasons why it may be appropriate for you to use Core Data. One of the simplest metrics is that, with Core Data, the amount of code you write to support the model layer of your application is typically 50% to 70% smaller as measured by lines of code.

LostCharacterDatabase
=====================


As a user, I want to see some of the Lost characters in a list
2 points

    You know. The show. It was on ABC.
    Pre-populate a CoreData database using this plist.
        hint: think laterally. There are many different ways to accomplish this step
        hint: only pre-populate if the database is empty!

As a user, I want to be able to add the other members of Lost
3 points

    They should remain in alphabetical order
    When you restart the app, the characters must still be there
    The user interface for this step should be inside a new, separate view controller

As a user, I want to see all of the data for each member in the list
2 points

    You can subclass UITableViewCell and add additional UILabels
    Your entity that represents Lost characters should have at least five attributes, e.g. hair-color, plane-seat, gender, age, et cetera.

As a user, I want to delete rows for characters that die
3 points

    Use UITableView’s swipe-to-delete functionality
    The red button should say: SMOKE MONSTER 

As a user, I want to filter the list of characters
2 points

    You can choose how you filter the characters (i.e. name, hair color, plane seat, etc.)


Stretch
=======


As a user, I want to add a photos for each character
3 points

    The photos should be available even when there is no internet connection


As a user, I want to enable an edit mode for deleting multiple characters at a time
3 points

No engineering tasks


As a user I want to add relationships (lovers, siblings, and children) between characters
3 points

No engineering tasks
