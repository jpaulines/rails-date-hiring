# Clear the DB
puts "Starting DB Seed"
puts "Seeding now..."

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

# Create male users

10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    city: "Tel Aviv",
    description: Faker::Quote.famous_last_words,
    profile_image: "https://hips.hearstapps.com/esquireuk.cdnds.net/15/37/2048x2730/2048x2730-christian-bale-esquire-interview-1-43-jpg-9c19949d.jpg?resize=480:*",
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

# Create femal users

10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    city: "Tel Aviv",
    description: Faker::Quote.famous_last_words,
    profile_image: "https://hips.hearstapps.com/esquireuk.cdnds.net/15/37/2048x2730/2048x2730-christian-bale-esquire-interview-1-43-jpg-9c19949d.jpg?resize=480:*",
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


  puts "Finished seeding!"

