# README

## MOVES 
- Each Pokemon has a list of moves it can learn, but can only have 4 of those moves at a time. When adding/removing moves to a Pokemon, would there need to be another model for what moves a Pokemon has assigned to it in addition to the moves that it can know? How would that data be saved? 

  -  - The same question goes for abilities and nature. 

  -  -  - Is there a way to make sure this is future proofed, where if I wanted to add the ability for a user to edit their Pokemon's moves (which might not be in the scope for now), I could implement it easily?

  - If users can have more than one of an identical Pokemon (like, more than one Bulbasaur), there would need to be a separate instance of that Bulbasaur in their collection, so I wouldn't use ```find_or_create_by``` when they add a Pokemon to their collection, I'd just use ```.create```, right? 
