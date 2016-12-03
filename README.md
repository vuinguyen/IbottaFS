# IbottaFS

To see a video demo of this app, go to:

https://youtu.be/uZDZsAMjz9s

My app is called IbottaFS, which stands for "Ibotta Fun Size", because it's a miniature version of the Ibotta app. It runs in XCode 8 for Swift 2.3. I wrote this app for my interview/job application for the iOS developer position at Ibotta. My version of the Ibotta app was designed to work like a checklist app, which is different from how the actual Ibotta app works today.

The idea behind my app flow was to do something different, because I realized that when I make my shopping list, I first decide what I want to buy, and then decide where I'm going to shop. So, IbottaFS allows the user to search offers by category instead of by retailer (which is what the current Ibotta app does). The first screen represents your "shopping list," a list of offers on products you would like to buy, and where to find those offers. It is prepopulated with some hard-coded offers just for this demo, to give an idea of what the offers will look like before you start. On the first screen, click on the + sign to browse offers by category. Go through several tableviews to search for the offer that you want, and when you reach an Offer detail screen, click "Add". That adds your offer to the Offer checklist, which is the first screen, and returns you to the Offer checklist. Then, when you've added all the offers you want to the checklist, you can see at a glance which retailer(s) offer most or all of the offers that you selected!

When you get to an Offer detail screen, you can also select "Retailers for this Offer" to see the list of retailers for that offer in its own tableview. The Offer detail screen is also available from the offers in the Offer checklist.

I tried to follow an MVVC framework as best as I could - providing model classes and model management classes for the data objects, so that the ViewControllers don't get too big. They say that MVVC is a better framework to follow now than traditional MVC.