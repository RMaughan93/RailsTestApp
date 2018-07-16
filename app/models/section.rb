class Section < ApplicationRecord

    has_many :section_edits
    has_many :editors, :through => :section_edits, :class_name => "AdminUser"

    CONTENT_TYPES = ['text', 'HTML']

    validates_presence_of :name 
    validates_length_of :name, :maximum => 255
    validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "Must be one of: #{CONTENT_TYPES.join(', ')}"
    validates_presence_of :content 

    scope :visibile, lambda {where(:visibile => true)}
    scope :invisibile, lambda {where(:visibile => false)}
    scope :sorted, lambda {order("sections.position ASC")}
    scope :newest_first, lambda {order("sections.created_at DESC")}
end
