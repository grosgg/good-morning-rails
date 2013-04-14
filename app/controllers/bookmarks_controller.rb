class BookmarksController < ApiController

  # GET /bookmarks.json
  def index
    respond_with current_user.bookmarks
  end

  # GET /bookmarks/1.json
  def show
    begin
      respond_with current_user.bookmarks.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # POST /bookmarks.json
  def create
    params[:bookmark][:user] = current_user
    @bookmark = Bookmark.new(params[:bookmark])

    if @bookmark.save
      respond_with @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # PUT /bookmarks/1.json
  def update
    begin
      @bookmark = current_user.bookmarks.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @bookmark.update_attributes(params[:bookmark])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1.json
  def destroy
    begin
      @bookmark = current_user.bookmarks.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @bookmark.destroy
      head :no_content
    rescue
      render :json => { :errors => ["Record was not deleted."] },  :success => false, :status => :unprocessable_entity
    end
  end

end
