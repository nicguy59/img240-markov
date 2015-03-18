class StoriesController < ApplicationController
  helper_method :current_author

  def index
    @authors = Story::AUTHORS
  end

  def show
    @story = Story.new(params[:id])
  end

  private

  def current_author
    params[:id] || :none
  end
end
