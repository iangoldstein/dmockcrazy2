class Candidate < ActiveRecord::Base
  attr_accessible :name

  validates :name,  :presence => true

  has_many :votes,
           :dependent => :destroy

  # Clear votes records before destroy
  before_destroy :clear_votes

  protected
  def clear_votes
    votes.clear
  end
end
