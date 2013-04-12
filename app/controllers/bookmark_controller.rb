class BookmarksController < ApplicationController
  # GET /bookmarks.json
  def get
      @bookmarks = Bookmark.all

      respond_to do |format|
          format.json {render json: @bookmarks}
      end
  end

  def post
  end

  def put
  end

  def delete
  end
end
