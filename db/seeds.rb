require 'faker'

User.delete_all
Vote.delete_all
Pitch.delete_all
Round.delete_all
PitchRound.delete_all
Team.delete_all


  user1 = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', admin: true )

  5.times do
    User.create!({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      admin: false
    })
  end


  5.times do
    Pitch.create!({
      :title      => Faker::Lorem.word ,
      :description  => Faker::Lorem.sentence,
      :user_id => [2,3,4,5,6].sample
    })
  end

  pitches = Pitch.all

  Round.create!({round_number: 1})

  Round.create!({round_number: 2})
  
  PitchRound.create!({round_id: 1, pitch_id: 1 })
  PitchRound.create!({round_id: 1, pitch_id: 2 })
  PitchRound.create!({round_id: 1, pitch_id: 3 })
  PitchRound.create!({round_id: 1, pitch_id: 4 })
  PitchRound.create!({round_id: 1, pitch_id: 5 })

  Round.create!({round_number: 2})


  Vote.create!({:user_id => 1, :pitch_id => 1, :round_id => 1})
  Vote.create!({:user_id => 2, :pitch_id => 2, :round_id => 1})
  Vote.create!({:user_id => 3, :pitch_id => 1, :round_id => 1})
  Vote.create!({:user_id => 4, :pitch_id => 2, :round_id => 2})
  Vote.create!({:user_id => 5, :pitch_id => 1, :round_id => 2})

