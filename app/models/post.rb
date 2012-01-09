class Post < ActiveRecord::Base
    validates :name, :presence => true #name must be present
    validates :body, :presence => true #name must be present
    validates :title, :presence => true, #title must be present
              :length => {:minimum => 5} #title must have minimum length of 5
    has_many :comments, :dependent => :destroy #delete all comments dependent on a post when a post is deleted 
    has_many :tags
    
    
    
    accepts_nested_attributes_for :tags, :allow_destroy => true,
                                  :reject_if => proc {|attrs| attrs.all? { |k, v| v.blank? } } 
    # The :allow_destroy option on the nested attribute declaration tells
    # Rails to display a “remove” checkbox on the view that you’ll build 
    # shortly. The :reject_if option prevents saving new tags that do not
    # have any attributes filled in.
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

