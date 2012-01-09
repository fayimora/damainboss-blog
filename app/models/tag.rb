class Tag < ActiveRecord::Base
  belongs_to :post
end

# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#