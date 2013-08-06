require 'position_mover'
class SectionEdit < ActiveRecord::Base
  attr_accessible :admin_user, :section, :summary

  include PositionMover

  belongs_to :editor, :class_name => "AdminUser", :foreign_key => 'admin_user_id'
  belongs_to :section

  private
  def position_scope
    "sections.page_id = #{page_id.to_i}"
  end
end
