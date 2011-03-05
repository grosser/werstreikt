class User < ActiveRecord::Base
  GENDERS = [:unknown, :male, :female]

  validates_presence_of :first_name, :last_name, :fb_id, :email
  validates_format_of :email, :with => /@/
  validates_inclusion_of :gender_id, :in => GENDERS.keys

  def gender
    GENDERS[gender_id]
  end

  def gender=(value)
    self.gender_id = GENDERS.index(value.to_sym).to_i
  end

  def name
    "#{first_name} #{last_name}"
  end

  def is_owner?(object)
    object.creator_id == id
  end
end
