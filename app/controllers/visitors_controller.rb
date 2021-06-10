# frozen_string_literal: true

# Controller responsible to display visitors details ...
class VisitorsController < ApplicationController
  before_action :set_shortened_url, only: %i[index]
  def index
    @visitors = @shortened_url.visitors
  end

  private

  def set_shortened_url
    @shortened_url = ShortenedUrl.find(params[:shortened_url_id])
  end
end
