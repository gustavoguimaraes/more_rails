class Membership < ActiveRecord::Base
  belongs_to :league
  belongs_to :user

  default_scope order('rank ASC')

  def self.order_users(league)
     where(league: league).sort_by { |m| m.user.total_points }
  end

  def self.order_by_points(league)
    order_users(league).reverse!
  end

  def self.rank_members(league)
    order_by_points(league).each_with_index do |member, index|
      member.update_attributes(rank: index+1)
    end
  end

end
