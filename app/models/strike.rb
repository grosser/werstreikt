class Strike < ActiveRecord::Base
  validates_presence_of :start_on, :end_on, :organisation, :creator_id

  belongs_to :creator, :class_name => 'User'
end
