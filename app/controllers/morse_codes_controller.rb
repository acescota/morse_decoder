class MorseCodesController < ApplicationController
  before_action :set_morse_code, only: [:show, :edit, :update, :destroy]

  # GET /morse_codes
  # GET /morse_codes.json
  def index
    @morse_codes = MorseCode.all
  end

  # GET /morse_codes/1
  # GET /morse_codes/1.json
  def show
  end

  # GET /morse_codes/new
  def new
    @morse_code = MorseCode.new
  end

  # GET /morse_codes/1/edit
  def edit
  end

  # POST /morse_codes
  # POST /morse_codes.json
  def create
    @morse_code = MorseCode.new(morse_code_params)

    respond_to do |format|
      if @morse_code.save
        format.html { redirect_to @morse_code, notice: 'Morse code was successfully created.' }
        format.json { render :show, status: :created, location: @morse_code }
      else
        format.html { render :new }
        format.json { render json: @morse_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /morse_codes/1
  # PATCH/PUT /morse_codes/1.json
  def update
    respond_to do |format|
      if @morse_code.update(morse_code_params)
        format.html { redirect_to @morse_code, notice: 'Morse code was successfully updated.' }
        format.json { render :show, status: :ok, location: @morse_code }
      else
        format.html { render :edit }
        format.json { render json: @morse_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /morse_codes/1
  # DELETE /morse_codes/1.json
  def destroy
    @morse_code.destroy
    respond_to do |format|
      format.html { redirect_to morse_codes_url, notice: 'Morse code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def translate
    user_input = params[:user_input]

    @translation = MorseCode.translate_me(user_input) if user_input.present?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_morse_code
      @morse_code = MorseCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def morse_code_params
      params.require(:morse_code).permit(:code, :translation)
    end
end
