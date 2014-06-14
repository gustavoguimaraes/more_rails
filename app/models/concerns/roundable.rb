require 'active_support/concern'

module Roundable
  extend ActiveSupport::Concern

  included do
    has_many :rounds, as: :game_id
    has_many :games, through: :rounds

    def self.this_round
      includes(:rounds).where( rounds: { current: true} ).references(:rounds)
    end
  end
end
