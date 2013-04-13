class BookmarksController < ApiController
 
  def index
    respond_with current_user.bookmarks
  end

  def show
    begin
      respond_with current_user.bookmarks.find(params[:id])
    rescue
      return record_not_found
    end

  end
 
end
