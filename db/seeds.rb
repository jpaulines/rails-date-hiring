puts "Starting DB Seed"
puts "Seeding now..."

# Clear the DB
Event.destroy_all
EventCategory.destroy_all
Booking.destroy_all
User.destroy_all


# Constants to draw from

STRENGTHS = [
  "Good judge of character",
  "Great dancer",
  "Optimistic",
  "Seeks adventure",
  "Can debate politics",
  "Morning person",
  "Great laugh",
  "Moms love me",
  "Moms love me",
  "Straightforward and direct",
  "Career driven",
  "Career driven",
  "Great with kids",
  "Well decorated passport",
  "Great singer",
  "Keeps up with fashion"
]

LANGUAGES = [
  "English",
  "French",
  "German",
  "Chinese",
  "Hebrew"
]

HIDDEN_TALENTS = [
  'Shuffle a deck of cards',
  'Peel an orange in one piece',
  'Roll your tongue',
  'Say the alphabet backwards',
  'Shadow puppetry',
  'Complex mental arithmetic',
  'Do a cartwheel',
  'Wolf whistle',
  'Do a handstand',
  'Flip a stack of coasters',
  'Fit a high number of Malteasers in your mouth',
  'Hit the bull’s eye on a dartboard',
  'Keepie-uppies with a football',
  'List historic kings and queens',
  'Bounce a penny into a glass',
  'Juggling',
  'Balance a can on its tipping point',
  'The Moonwalk',
  'Draw a perfect circle',
  'Solve a Rubik’s Cube',
  'Touch the tip of your nose with your big toe',
  'A snooker/pool table ‘trick shot’',
  'Make a coin disappear',
  'Touch the tip of your nose with your tongue',
  'Demonstrate doubler-jointedness',
  'Bird calls',
  'Open a champagne bottle with a knife',
  'Wiggle your ears',
  'Open a bottle with your teeth',
  'Reliably score 180 on a dart board',
  'Put your legs behind your head',
  'Guess someone’s playing card',
  'Make your muscles dance',
  'Pull the tablecloth from a cluttered dinner table',
  'Name all US states in alphabetical order',
  'Guess the number someone is thinking of',
  'Do the splits',
  'Light a match with your thumb',
]

AMENITIES = [
  "Flight included",
  "Hotel included",
  "Meals included"
]

EVENT_NAMES_PREFIX = [
  "A casual ",
  "A fun ",
  "An exciting ",
  "A relaxed ",
  "A chill ",
  "A formal ",
  "A friend's ",
  "My brother's ",
  "Come to my ",
  "Join me for my ",
  "Accompany me to my ",
  "For a good time, come to my ",
  "Don't miss a super fun ",
  "For the best time, come to my "
]

EVENT_CATEGORIES = [
  ["Wedding", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262535/Event%20Category%20Default%20Images/wedding_z444nt.jpg"],
  ["Dinner Party", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262537/Event%20Category%20Default%20Images/dinner_party_aue1vv.jpg"],
  ["Family Event", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262534/Event%20Category%20Default%20Images/family_event_afpwxi.jpg"],
  ["Birthday Party", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262532/Event%20Category%20Default%20Images/birthday_party_k5tv2v.jpg"],
  ["Concert", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262536/Event%20Category%20Default%20Images/concert_ejse9z.jpg"],
  ["School Reunion", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262868/Event%20Category%20Default%20Images/school_reunion_fquowu.jpg"],
  ["Charity Event", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262533/Event%20Category%20Default%20Images/charity_event_yvhjlw.jpg"],
  ["Barbeque", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262532/Event%20Category%20Default%20Images/Barbeque_idh00s.jpg"],
  ["Club Event", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262533/Event%20Category%20Default%20Images/Club_Event_yi0fyt.jpg"],
  ["Family Vacation", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262534/Event%20Category%20Default%20Images/family_vacation_bwrlhm.jpg"],
  ["Event Premiere", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262533/Event%20Category%20Default%20Images/event_premiere_iwxmd6.jpg"],
  ["House Party", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262536/Event%20Category%20Default%20Images/house_party_jplu8l.jpg"],
  ["Chef's Tasting", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262533/Event%20Category%20Default%20Images/chef_tasting_r3pgzq.jpg"],
  ["Sports Game", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262536/Event%20Category%20Default%20Images/sports_game_xiex97.jpg"],
  ["Bar Mitsvah", "https://res.cloudinary.com/dakarw0uq/image/upload/v1568262532/Event%20Category%20Default%20Images/bar_mitsvah_xmpu6l.jpg"]
]

WISHLIST = [
  "Looking for someone fun who can keep up! Fun, but not overbearing, you?",
  "Would love someone chill who can just hang and be one of the group. Low pressure, just want you to be you!",
  "Looking for someone with great conversational skills. I'm kind of quiet, so it would be a good complement.",
  "Would like someone quieter as I'm pretty loud, haha. We'd make a good duo for the event!",
  "Not to be shallow, but would like someone really good looking. Like, really, really good looking.",
  "Someone who can entertain the other people at the event. I'm not so good at being the center of attention.",
  "Would like someone who doesn't drink as I'm sober now. Would be good if we matched that way!",
  "Looking for someone who can dance. Because, well, let's say I'm not so fly... You lead, I'll follow!",
  "Someone who is just optimistic and up for anything. The people at the event will be kind of unpredictable, haha.",
  "Someone who can deal with my crazy relatives. I promise I'm not that crazy, though!",
  "Would love someone tall! And fun. And will get up on the karaoke stage.",
  "Looking for someone who doesn't mind being embarrassed and can put themselves out there.",
  "Not too picky except for a good dresser. The people at the event are pretty fashion conscious, and I am too!",
  "Someone who is pretty athletic and can keep up. It will be fun, I promise!"
]

CITIES = [
'Allenby Street',
'Begin Road',
'Ben Yehuda',
'Dizengoff',
'HaArba\'a',
'HaMasger',
'HaYarkon',
'Ibn Gabirol',
'Ibn Gabirol',
'Kaplan',
'King George',
'Rothschild Boulevard',
'Sderot Yerushalayim',
'Yefet Street'
]

# Create static list of event categories

EVENT_CATEGORIES.each do |event_category|
  EventCategory.create(name: event_category[0], default_image: event_category[1])
end

# Create male users

15.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.username,
    password: '123456',
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    city: "Tel Aviv",
    description: Faker::Quote.famous_last_words,
    remote_profile_image_url: "https://res.cloudinary.com/dakarw0uq/image/upload/v1568110461/shct4ik7e0oqer86pfbh.jpg",
    height: (rand(1.6...1.9)).round(2).to_s,
    strength: STRENGTHS.sample,
    language: LANGUAGES.sample,
    hidden_talent: HIDDEN_TALENTS.sample,
    talkativeness: rand(4...10),
    funniness: rand(4...10),
    age: rand(20...45),
    gender: "Male"
  )
end

# Create female users

15.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.domain_word,
    password: '123456',
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    city: "Tel Aviv",
    description: Faker::Quote.famous_last_words,
    remote_profile_image_url: "https://res.cloudinary.com/dakarw0uq/image/upload/v1568110461/shct4ik7e0oqer86pfbh.jpg",
    height: (rand(1.50...1.75)).round(2).to_s,
    strength: STRENGTHS.sample,
    language: LANGUAGES.sample,
    hidden_talent: HIDDEN_TALENTS.sample,
    talkativeness: rand(4...10),
    funniness: rand(4...10),
    age: rand(20...45),
    gender: "Female"
  )
end

# create events and assign a user to each

60.times do
  ev_cat = EventCategory.all.sample
  Event.create!(
    name: EVENT_NAMES_PREFIX.sample + ev_cat.name,
    address: CITIES.sample + " " + rand(1...90).to_s + " Tel Aviv-Yafo",
    event_category: ev_cat,
    date: Date.today + rand(10...30),
    amenities: AMENITIES.sample,
    event_description: "This is going to be a really enjoyable #{ev_cat}. I know it starts kind of late, but be prepared to have a ton of fun. Keep an open mind!",
    wishlist: WISHLIST.sample,
    event_image: "https://res.cloudinary.com/dakarw0uq/image/upload/v1568110461/shct4ik7e0oqer86pfbh.jpg",
    user_id: User.all.sample.id,
    cost: ["0", "50", "75", "100", "150", "250"].sample,
  )
end

puts "Finished seeding!"

