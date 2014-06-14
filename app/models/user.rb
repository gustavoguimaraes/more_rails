class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:username]

  has_many :user_scores
  has_many :memberships
  # has_many :leagues, through: :memberships

  default_scope order('total_points DESC')

  def update_total_points
    return 0 if self.user_scores.empty?
    @all_points = self.user_scores.map { |us| us.points }
    self.update_attributes(total_points: @all_points.sum)
  end

  def self.rank_users
    all.each_with_index do |user, index|
      user.update_attributes(overall_rank: index+1)
    end
  end

end
