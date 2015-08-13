class SiteusersController <  AdmController
  before_action :set_siteuser, only: [:show, :edit, :update, :destroy]

  # GET /siteusers
  # GET /siteusers.json
  def index
    @siteusers = Siteuser.all
  end

  # GET /siteusers/1
  # GET /siteusers/1.json
  def show
  end

  # GET /siteusers/new
  def new
    @siteuser = Siteuser.new
  end

  # GET /siteusers/1/edit
  def edit
  end

  # POST /siteusers
  # POST /siteusers.json
  def create
    @siteuser = Siteuser.new(siteuser_params)

    respond_to do |format|
      if @siteuser.save
        format.html { redirect_to @siteuser, notice: 'Siteuser was successfully created.' }
        format.json { render :show, status: :created, location: @siteuser }
      else
        format.html { render :new }
        format.json { render json: @siteuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siteusers/1
  # PATCH/PUT /siteusers/1.json
  def update
    respond_to do |format|
      if @siteuser.update(siteuser_params)
        format.html { redirect_to @siteuser, notice: 'Siteuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @siteuser }
      else
        format.html { render :edit }
        format.json { render json: @siteuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteusers/1
  # DELETE /siteusers/1.json
  def destroy
    @siteuser.destroy
    respond_to do |format|
      format.html { redirect_to siteusers_url, notice: 'Siteuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siteuser
      @siteuser = Siteuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def siteuser_params
    params.require(:siteuser).permit(:role)
    end
end
