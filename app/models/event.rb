require 'date'
class Event < ActiveRecord::Base
  has_many :participators, :dependent => :destroy
  has_many :users, :through => :participators
  %w(tutor girl).each do |role|
    %w(invited attended applied).each do |state|
      define_method :"#{state}_#{role.pluralize}" do
        users.where(:participators => {:"#{state}" => true}, :role => role)
      end
    end
    define_method :"#{role.pluralize}" do
      users.where(:role => role)
    end
  end

  validates :date, :title, :summary, :presence => false

  accepts_nested_attributes_for :participators
  attr_accessible :body, :summary, :date, :title, :participators_attributes, :as => :admin

  def pair
    tutors = attended_tutors.shuffle
    girls = attended_girls.shuffle
    return {} if  tutors.size * girls.size == 0

    t_g_ratio = (girls.size / tutors.size).to_i
    # puts "girls: #{girls.size} tutors: #{tutors.size} t_g_ratio: #{t_g_ratio}"

    result = {}

    tutors.each do |tutor|
      result.merge! tutor => girls.slice!(0, t_g_ratio)
    end

    girls.each_with_index do |girl, i|
      result.values[i]<< girl
    end

    result
  end

  def rand_invite_girls(size)
    self.invited_girls.destroy_all

    User.girls.shuffle[0..size-1].each do |girl|
      self.participators.build({:user_id => girl.id,
                                :invited => true},
                               :as => :admin)
    end

    self.save!
  end

  def invite_tutors
    self.invited_tutors.destroy_all

    User.tutors.each do |tutor|
      self.participators.build({:user_id => tutor.id,
                                :invited => true},
                               :as => :admin)
    end

    self.save!
  end

  def attended?(user)
    participators.where(:user_id => user.id, :attended => true).exists?
  end

  def attend(user)
    false if self.date != Date.today
    unless p = participators.where(:user_id => user.id).first
      p = self.participators.build
      p.user = user
    end
    p.attended = true
    p.save
  end

  def applied?(user)
    users.where(:id => user.id).exists?
  end

  def apply(user)
    false if applied? user
    p = participators.build :applied => true
    p.user = user
    p.save
  end

  # for rails_admin
  def name
    self.date
  end

end
