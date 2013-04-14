class StickyboardsController < ApiController

  # GET /stickyboards.json
  def index
    respond_with Stickyboard.all
  end

  # GET /stickyboards/1.json
  def show
    begin
      respond_with Stickyboard.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # PUT /stickyboards/1.json
  def update
    begin
      @stickyboard = Stickyboard.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @stickyboard.update_attributes(params[:stickyboard])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

end
