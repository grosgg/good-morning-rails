class KunidaysController < ApiController

  # GET /kunidays.json
  def index
    #respond_with Kuniday.all
    currentDate = Date.today
    thisWeek = currentDate.cweek
    nextWeek = currentDate.cweek+1
    year = currentDate
    if thisWeek == 52 then
        nextWeek = 1
        year = year+1
    end

    # Get this week entries
    tWeekKunidays = Kuniday.where("week = ? AND year = ?", currentDate.cweek, currentDate.year)

    tWeekHash = {}
    tWeekKunidays.each do |day|
      tWeekHash[day.weekday] = day
    end

    # Get next week entries
    nWeekKunidays = Kuniday.where("week = ? AND year = ?", currentDate.cweek+1, currentDate.year)

    nWeekHash = {}
    nWeekKunidays.each do |day|
      nWeekHash[day.weekday] = day
    end

    results = {:tWeek => tWeekHash, :nWeek => nWeekHash}
    respond_with results
  end

  # GET /kunidays/1.json
  def show
    begin
      respond_with Kuniday.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # POST /kunidays.json
  def create
    params[:kuniday][:user] = current_user
    @kuniday = Kuniday.new(params[:kuniday])

    if @kuniday.save
      respond_with @kuniday
    else
      render json: @kuniday.errors, status: :unprocessable_entity
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
