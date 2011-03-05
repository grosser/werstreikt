class Strike < ActiveRecord::Base
  validates_presence_of :start_at, :end_at, :organisation, :creator_id

  belongs_to :creator, :class_name => 'User'
end
