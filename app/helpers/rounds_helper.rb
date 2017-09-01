module RoundsHelper

  def voted?(round)
    round.votes.any? {|vote| vote.user_id == current_user.id}
  end
end
