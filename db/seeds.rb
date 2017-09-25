require 'faker'

User.delete_all
Vote.delete_all
Pitch.delete_all
Round.delete_all
PitchRound.delete_all
Team.delete_all


  user1 = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', admin: true )

  15.times do
    User.create!({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      admin: false
    })
  end

  Pitch.create!({
      :title      => "Our Trip" ,
      :description  => "A mobile app that allows friends to collaborate on planning a trip",
      :user_id => [2,3,4,5,6].sample
    })

  Pitch.create!({
      :title      => "Voting System" ,
      :description  => "A web app that allows students to vote on ideas and for teachers to form teams based on the ideas.",
      :user_id => [2,3,4,5,6].sample
    })

  Pitch.create!({
      :title      => "Forms" ,
      :description  => "A mobile app that allows dances to block out formations.",
      :user_id => [2,3,4,5,6].sample
    })

  Pitch.create!({
      :title      => "Translator" ,
      :description  => "A mobile app that translates every line in a book to a language of your choice.",
      :user_id => [2,3,4,5,6].sample
    })

  Pitch.create!({
      :title      => "Spotifly" ,
      :description  => "A mobile app that is able to identify every flying insect.",
      :user_id => [2,3,4,5,6].sample
    })

  pitches = Pitch.all

