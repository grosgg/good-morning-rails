require 'news_api'

class NewsstreamsController < ApiController

  # GET /newsstreams.json
  def index
    newsarticles = Array.new
    current_user.newsstreams.each do |stream|
      articles = NewsApi.fetch(stream.url)

      row = {}
      row[:stream] = stream
      row[:articles] = articles[0..4]

      newsarticles.push(row)
    end
    respond_with newsarticles.to_json
  end

  # GET /newsstreams/1.json
  def show
    begin
      respond_with current_user.newsstreams.find(params[:id])
    rescue
      return record_not_found
    end
  end

  # POST /newsstreams.json
  def create
    params[:newsstream][:user] = current_user
    @newsstream = Newsstream.new(params[:newsstream])

    if @newsstream.save
      respond_with @newsstream
    else
      render json: @newsstream.errors, status: :unprocessable_entity
    end
  end

  # PUT /newsstreams/1.json
  def update
    begin
      @newsstream = current_user.newsstreams.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @newsstream.update_attributes(params[:newsstream])
      head :no_content
    rescue
      render :json => { :errors => ["Record was not updated."] }, status: :unprocessable_entity
    end
  end

  # DELETE /newsstreams/1.json
  def destroy
    begin
      @newsstream = current_user.newsstreams.find(params[:id])
    rescue
      return record_not_found
    end

    begin
      @newsstream.destroy
      head :no_content
    rescue
      render :json => { :errors => ["Record was not deleted."] },  :success => false, :status => :unprocessable_entity
    end
  end

end
