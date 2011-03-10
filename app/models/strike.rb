class Strike < ActiveRecord::Base
  attr_accessible :start_on, :end_on, :organisation, :comment

  validates_presence_of :start_on, :end_on, :organisation, :creator_id

  belongs_to :creator, :class_name => 'User'

  scope :in_next_days, lambda{|days| where("start_on <= ? and ? <= end_on", Date.today+days, Date.today) }

  def include?(date)
    start_on <= date and date <= end_on 
  end
end
