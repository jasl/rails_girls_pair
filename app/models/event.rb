require 'date'
class Event < ActiveRecord::Base
  has_many :participators

  has_many :users, :through => :participators

  #has_many :tutors, :source => :user, :through => :participators,
  #         :conditions => { :role => 'tutor' }
  #has_many :girls, :source => :user, :through => :participators,
  #         :conditions => { :role => 'girl' }

  has_many :invited_tutors, :source => :user, :through => :participators, :readonly => true,
           :conditions => {:participators => {:invited => true}, :role => 'tutor'}
  has_many :invited_girls, :source => :user, :through => :participators, :readonly => true,
           :conditions => {:participators => {:invited => true}, :role => 'girl'}

  has_many :attended_tutors, :source => :user, :through => :participators, :readonly => true,
           :conditions => {:participators => {:attended => true}, :role => 'tutor'}
  has_many :attended_girls, :source => :user, :through => :participators, :readonly => true,
           :conditions => {:participators => {:attended => true}, :role => 'girl'}

  validates :date, :title, :presence => false

  after_initialize "self.date ||= Date.today"

  accepts_nested_attributes_for :participators

  attr_accessible :body, :date, :title, :participators_attributes, :as => :admin

  def pair
    tutors = self.attended_tutors.shuffle
    girls = self.attended_girls.shuffle
    return {} if  tutors.size * girls.size == 0

    t_g_ratio = (girls.size / tutors.size).to_i
    puts "girls: #{girls.size} tutors: #{tutors.size} t_g_ratio: #{t_g_ratio}"

    result = {}

    tutors.each do |tutor|
      result.merge! tutor => girls.slice!(0, t_g_ratio)
    end
    result.values[0] += girls

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

  def attend(user_id)
    false if self.date != Date.today
    if p = self.participators.where(:user_id => user_id).first
      p.attended = true
      p.save
    else
      self.participators.create({:user_id => user_id,
                                 :attended => true},
                                :as => :admin)
    end
  end

  # for rails_admin
  def name
    self.date
  end

end
