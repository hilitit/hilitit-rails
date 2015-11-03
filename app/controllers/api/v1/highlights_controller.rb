class Api::V1::HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user! , :except => [:index]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }



  # GET /highlights
  # GET /highlights.json
  def index
    @highlights = Highlight.where(nil)
    @highlights = @highlights.hostname(params[:hostname]) if params[:hostname].present?
    @highlights = @highlights.pathname(params[:pathname]) if params[:pathname].present?
    @highlights = @highlights.port(params[:port]) if params[:port].present?
    @highlights = @highlights.protocol(params[:protocol]) if params[:protocol].present?
    @highlights = @highlights.search(params[:search]) if params[:search].present?
    @highlights = @highlights.pathname_hash(params[:pathname_hash]) if params[:pathname_hash].present?
    render "highlights/index"
  end

  # GET /highlights/1
  # GET /highlights/1.json
  def show
    render "highlights/show"
  end

  # GET /highlights/new
  #def new
  #  @highlight = Highlight.new(user: current_user)
  #end

  # GET /highlights/1/edit
  def edit
  end

  # POST /highlights
  # POST /highlights.json
  def create
    #puts "create ..."
    puts highlight_params
    @highlight = Highlight.new(highlight_params)
    @highlight.user = current_user

    respond_to do |format|
      if @highlight.save
        format.json { render "highlights/show" , status: :created, location: @highlight }
      else
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highlights/1
  # PATCH/PUT /highlights/1.json
  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        #format.html { redirect_to @highlight, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @highlight }
      else
        #format.html { render :edit }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highlights/1
  # DELETE /highlights/1.json
  def destroy
    @highlight.destroy
    respond_to do |format|
      #format.html { redirect_to highlights_url, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highlight
      @highlight = Highlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highlight_params
      #params.require(:highlight).permit(:selector, :text, :host, :port ,:path, :start_offset, :end_offset)
      p = JSON.parse(params[:highlight])
      puts "highlight_params"
      #puts p
      p.slice( 'selector', 'text', 'hostname', 'port' , 'pathname' ,'search', 'pathname_hash', 'protocol', 'start_offset', 'end_offset', 'tag_name' )
      #params.require(:highlight).permit( 'selector', 'text', 'hostname', 'port' , 'pathname' ,'search', 'pathname_hash', 'protocol', 'start_offset', 'end_offset' )

    end
end
