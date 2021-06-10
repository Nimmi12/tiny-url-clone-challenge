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
class ShortenedUrl < ApplicationRecord
  # Validations...
  validates :url, presence: true
  validates_uniqueness_of :url
  validates :url, format: { with: URI.regexp }

  validates :slug, presence: true
  validates_uniqueness_of :slug
end
