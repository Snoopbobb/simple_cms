#require 'position_mover'
class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible, :created_at

  include PositionMover

  has_many :pages

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('subjects.position ASC')
  scope :search, lambda {|query| where(["name Like ?", "%#{query}%"])}
end
