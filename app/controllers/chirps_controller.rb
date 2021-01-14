class ChirpsController < ApplicationController
  before_action :set_chirp, only: [:show, :update, :destroy, :vote]

  # GET /chirps
  # GET /chirps.json
  def index
    @chirps = Chirp.all
    # upvotes * 1/amt of days
    @chirps = @chirps.sort_by do |chirp|
      days_since_creation = (Time.now - chirp.created_at)/86400
      (chirp.upvote + 0.05) * 1/days_since_creation
    end.reverse
  end

  def vote
    current_amt = @chirp.upvote
    new_amt = case params[:type]
      when "up"
        current_amt + 1
      when "down"
        current_amt - 1
    end

    @chirp.update(upvote: new_amt)

    redirect_to chirps_url, notice: 'Chirp was upvoted'
  end

  # GET /chirps/1
  # GET /chirps/1.json
  def show
  end

  # GET /chirps/new
  def new
    @chirp = Chirp.new
  end

  # GET /chirps/1/edit
  def edit
  end

  # POST /chirps
  # POST /chirps.json
  def create
    @chirp = Chirp.new(chirp_params)

    respond_to do |format|
      if @chirp.save
        ChirpNotificationJob.perform_later(@chirp)

        format.html { redirect_to @chirp, notice: 'Chirp was successfully created.' }
        format.json { render :show, status: :created, location: @chirp }
      else
        format.html { render :new }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chirps/1
  # PATCH/PUT /chirps/1.json
  def update
    respond_to do |format|
      if @chirp.update(chirp_params)
        format.html { redirect_to @chirp, notice: 'Chirp was successfully updated.' }
        format.json { render :show, status: :ok, location: @chirp }
      else
        format.html { render :edit }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chirps/1
  # DELETE /chirps/1.json
  def destroy
    @chirp.destroy
    respond_to do |format|
      format.html { redirect_to chirps_url, notice: 'Chirp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chirp_params
      params.require(:chirp).permit(:text)
    end
end
