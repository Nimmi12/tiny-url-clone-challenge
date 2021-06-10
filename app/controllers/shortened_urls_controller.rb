# frozen_string_literal: true

# Controller responsible for shortening URLs ...
class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: %i[destroy]

  # GET /shortened_urls or /shortened_urls.json
  def index
    @base_url = request.url
    @shortened_urls = ShortenedUrl.all
  end

  # GET /shortened_urls/1 or /shortened_urls/1.json
  def show
    @shortened_url = ShortenedUrl.find_by(slug: params[:id])
    add_visitors_info
    redirect_to @shortened_url.url
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
  end

  # POST /shortened_urls or /shortened_urls.json
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    @shortened_url.slug = generate_slug

    respond_to do |format|
      if @shortened_url.save
        format.html { redirect_to shortened_urls_url, notice: 'Shortened url was successfully created.' }
        format.json { render :show, status: :created, location: @shortened_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortened_urls/1 or /shortened_urls/1.json
  def destroy
    @shortened_url.destroy
    respond_to do |format|
      format.html { redirect_to shortened_urls_url, notice: 'Shortened url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shortened_url
    @shortened_url = ShortenedUrl.find(params[:id])
  end

  def generate_slug
    SecureRandom.hex(10)
  end

  def add_visitors_info
    address = request.remote_ip
    vistor_rec = @shortened_url.visitors.find_or_create_by(ip_address: address)
    visits = (vistor_rec&.no_of_visits || 0) + 1
    vistor_rec&.update(no_of_visits: visits)
  end

  # Only allow a list of trusted parameters through.
  def shortened_url_params
    params.require(:shortened_url).permit(:url, :slug)
  end
end
