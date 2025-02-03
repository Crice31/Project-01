/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR pick_attempts = 3 //How many times user has to attempt to pick lock.
->intro_cellar

===intro_cellar===
You wake up and rub your eyes. Appearing to be stuck inside what seems to be a castle cellar. You look around and after time notice a guard that stops by to make sure your still in the cellar. As time passes your attention is brought to a few loose stones in the wall that you could climb out of. 
+ [Sneak out through the loose stones and crawl into the vents.] -> vent_entrance
+ [Creep out cellar into the hallway when guard is not near.] -> cellar_hallway
==returning_cellar==
You return to the cellar. Where will you go now?
+ [Sneak out through the loose stones and crawl into the vents.] -> vent_entrance
+ [Creep out cellar into the hallway when guard is not near.] -> cellar_hallway

==vent_entrance==
You shimmy your way into the ventalation systen and notice it's dimly lit, but you can still crawl through. On the other hand, you can go back and give the cellar door a try.
+[Continue crawling through the vents in hopes for a new room to enter.] -> vent_cover
+[Return to cellar] -> returning_cellar

==cellar_hallway==
After creeping past the gaurd and fleeing into the hall, you are met with 2 doors, labeled Master Bedroom, and Armory. Both doors are unlocked.
+[Enter the Armory] -> armory
+[Enter the Master Bedroom] -> bedroom
==bedroom==
You enter the master bedroom but there is nothing of use in the room.
+[Return to hallway.]->cellar_hallway
==armory==
You enter the armory and find a lock pick kit. You might want to grab that.
*[Pick up lock pick kit.]->pickup_lockpick
+[Explore further down the hall.]->main_hall
==armory_return==
You go back to the armory. Where should you go?
+[Return to the cellar hallway]->cellar_hallway
+[Explore down the hallway]->main_hall
==vent_cover==
You continue to crawl through the poorly lit vents{ not key_pickup: and run into a loosely fitting vent cover to open, leading to a vault of some sort.}. You also see light further down.
*[Push the cover out of the way and drop into the vault] -> vault
+[Keep crawling down towards the light spotted.]-> vent_ending
==vault==
You tumble into the vault and realize it is completely empty. What a bummer.
+[Return to vent.]->vent
==vent==
You stumble around and feel something cold and small make contact with your hands. It's a key! Now you can keep exploring and look for a lock to use it on!
*[Grab the key]-> key_pickup
+[Return to vent and keep exploring] ->vent_ending
+[Go back to cellar.]->returning_cellar
==key_pickup==
You grabbed the key.
+[Continue.]->vent
==vent_ending==
You make it to the light and look through. You spot a stairwell that looks like it may lead to an exit.
+[Jump out vents and break for it down the stairs.]->main_doors
+[Go back.]->vent
==main_doors==
You glance around the corner and see a large double door made of wood. It looks like you will need to key to get through.
+[Try using the key on the door.]->door_prompt
==pickup_lockpick==
You grab the kit.
+[Continue.]->armory
==main_hall==
You sneak down the hall way and find your self facing a door at the end of the hall.
Where could it lead to?
+[Open the door.]->main_doors
+[Turn back.]->cellar_hallway
==door_prompt==
You try the key but it just wont work.
+[Return back]->main_hall
*{pickup_lockpick}[With the lockpick, you can attempt to get through the door lock.]->ending
==ending==
You broke past the lock and escaped safely!
->END

