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
class Visitor < ApplicationRecord
  belongs_to :shortened_url
end
