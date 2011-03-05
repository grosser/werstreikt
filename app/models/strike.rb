class Strike < ActiveRecord::Base
  validates_presence_of :start_at, :end_at, :organisation, :creator_id
end
