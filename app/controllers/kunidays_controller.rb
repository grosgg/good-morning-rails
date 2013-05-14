class KunidaysController < ApiController

  # GET /kunidays.json
  def index
    #respond_with Kuniday.all
    currentDate = Date.today
    lastDayOfTheYear = Date.new(currentDate.cwyear,12,31)
    thisWeek = currentDate.cweek
    nextWeek = currentDate.cweek+1
    year = currentDate.cwyear
    if thisWeek == lastDayOfTheYear.cweek then
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

    results = {thisWeek => tWeekHash, nextWeek => nWeekHash}
    respond_with results
  end

  # GET /kunidays/2013-05-05.json
  def show
    begin
      respond_with Kuniday.find_by_date(params[:id])
    rescue
      return record_not_found
    end
  end

  # POST /kunidays.json
  def create
    @kuniday = Kuniday.find_or_create_by_year_and_week_and_weekday(params[:year], params[:week], params[:weekday]);

    d = Date.commercial(params[:year], params[:week], params[:weekday])
    params[:kuniday]['date'] = d

    begin
      @kuniday.update_attributes(params[:kuniday])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

end
