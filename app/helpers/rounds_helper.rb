module RoundsHelper

  def update_round
    @round.update(open: true)
  end

  def update_to_close_round
    round = Round.find_by(open: true)
    round.update(open: false)
  end

  def voted?(round)
    round.votes.any? {|vote| vote.user_id == current_user.id}
  end
end
