# == Schema Information
#
# Table name: visitors
#
#  id               :bigint           not null, primary key
#  shortened_url_id :bigint           not null
#  ip_address       :string
#  no_of_visits     :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
