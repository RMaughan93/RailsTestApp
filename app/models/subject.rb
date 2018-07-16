class Subject < ApplicationRecord

    has_many :pages

    acts_as_list 

    validates_presence_of :name
    validates_length_of :name, :maximum => 255 

    scope :visibile, lambda {where(:visibile => true)}
    scope :invisibile, lambda {where(:visibile => false)}
    scope :sorted, lambda {order("subjects.position ASC")}
    scope :newest_first, lambda {order("subjects.created_at DESC")}
    scope :search, lambda {|query|
        where(["name LIKE ?", "%#{query}%"])
    }
end
