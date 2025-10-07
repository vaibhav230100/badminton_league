<<<<<<< HEAD
# badminton_league
Badminton League app for FinMet interview
=======
# Badminton League - Project Plan

### Developer
**Vaibhav**  
Ruby on Rails Developer

---

### 1. Objective
Build a small web app to manage a badminton league where users can:
- Add and remove players  
- Record match results  
- View player rankings based on wins/losses  

### 2. Data Model
I started with two models:

**Player**
- name:string  
- wins:integer (default: 0)  
- losses:integer (default: 0)

**Match**
- player_one_id:integer  
- player_two_id:integer  
- winner_id:integer  

Relationships:
- Player has many matches  
- Match belongs to two players and one winner  

---

### 3. Flow of the App
- **PlayersController** handles player CRUD  
- **MatchesController** handles match creation and listing  
- When a match is saved, it automatically updates win/loss count for both players  

Routes:
```ruby
root "players#index"
resources :players, only: [:index, :new, :create, :destroy]
resources :matches, only: [:index, :new, :create]
>>>>>>> 4cc7785 (Badminton League app for FinMet interview)
