module ApplicationHelper

  def current_round
    Round.find_by(current: true)
  end

  def related(user)
    return if user.memberships.empty?
    related = user.memberships.map { |m| m.league.users }
    related.flatten!
  end


  def opponents(user)
    opponents = related(user)
    return [] if opponents.nil?
    opponents.delete_if { |opponent| opponent == user }
  end


  def newsfeed(user)
    related = related(user)
    return if related.nil?
    newsfeed = related.flatten.map { |related| related.user_scores }
    newsfeed.flatten!

  end

end
