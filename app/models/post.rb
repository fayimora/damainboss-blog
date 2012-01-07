class Post < ActiveRecord::Base
    validates :name, :presence => true #name must be present
    validates :body, :presence => true #name must be present
    validates :title, :presence => true, #title must be present
                  :length => {:minimum => 5} #title must have minimum length of 5
    has_many :comments 
end
