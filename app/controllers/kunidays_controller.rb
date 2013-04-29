class KunidaysController < ApiController

  # GET /kunidays.json
  def index
    #respond_with Kuniday.all
    currentDate = Date.today

    # Check if entries for this week exist
    Kuniday.where("week = ? AND year = ?", currentDate.cweek, currentDate.year)

    # Check if entries for next week exist
    Kuniday.where("week = ? AND year = ?", currentDate.cweek+1, currentDate.year)
  end

  # GET /kunidays/1.json
  def show
    begin
      respond_with Kuniday.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # PUT /kunidays/1.json
  def update
    begin
      @kuniday = Kuniday.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @kuniday.update_attributes(params[:kuniday])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

end
