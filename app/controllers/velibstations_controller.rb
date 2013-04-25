class VelibstationsController < ApiController

  # GET /velibstations.json
  def index
    respond_with current_user.velibstations
  end

  # GET /velibstations/1.json
  def show
    begin
      respond_with current_user.velibstations.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # POST /velibstations.json
  def create
    params[:velibstation][:user] = current_user
    @velibstation = Velibstation.new(params[:velibstation])

    if @velibstation.save
      respond_with @velibstation
    else
      render json: @velibstation.errors, status: :unprocessable_entity
    end
  end

  # PUT /velibstations/1.json
  def update
    begin
      @velibstation = current_user.velibstations.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @velibstation.update_attributes(params[:velibstation])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

  # DELETE /velibstations/1.json
  def destroy
    begin
      @velibstation = current_user.velibstations.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @velibstation.destroy
      head :no_content
    rescue
      render :json => { :errors => ["Record was not deleted."] },  :success => false, :status => :unprocessable_entity
    end
  end

end
