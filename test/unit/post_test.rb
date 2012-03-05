require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post should be invalid without a title"
    p = Post.new
    assert !z.valid?
  end
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

