# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  url        :text
#  slug       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
