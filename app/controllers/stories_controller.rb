class StoriesController < ApplicationController
  helper_method :current_author

  def index
    @authors = Story::AUTHORS
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @story = Story.new(params[:id])
  end

  private

  def current_author
    params[:id] || :none
  end
end
