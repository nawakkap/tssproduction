class FinishgoodsController < ApplicationController
  # GET /finishgoods
  # GET /finishgoods.json
  def index   
    @products = Product.all
    @staffs = Staff.all
     
    if params[:proddate] && params[:proddate] != "Select a date"
      @finishgoods = Finishgood.where(:sortDate => Date.parse(params[:proddate]).beginning_of_day..Date.parse(params[:proddate]).end_of_day)
    else
      @finishgoods = Finishgood.pastweek
    end
    
    @finishgoods.each do |finishgood|
        if !finishgood.production
          finishgood.production = Production.new
        end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finishgoods }
    end
  end

  # GET /finishgoods/1
  # GET /finishgoods/1.json
  def show
    @finishgood = Finishgood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finishgood }
    end
  end

  # GET /finishgoods/new
  # GET /finishgoods/new.json
  def new
    @finishgood = Finishgood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finishgood }
    end
  end

  # GET /finishgoods/1/edit
  def edit
    @finishgood = Finishgood.find(params[:id])
  end

  # POST /finishgoods
  # POST /finishgoods.json
  def create
    @finishgood = Finishgood.new(params[:finishgood])

    respond_to do |format|
      if @finishgood.save
        format.html { redirect_to @finishgood, notice: 'Finishgood was successfully created.' }
        format.json { render json: @finishgood, status: :created, location: @finishgood }
      else
        format.html { render action: "new" }
        format.json { render json: @finishgood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finishgoods/1
  # PUT /finishgoods/1.json
  def update
    @finishgood = Finishgood.find(params[:id])

    respond_to do |format|
      if @finishgood.update_attributes(params[:finishgood])
        format.html { redirect_to @finishgood, notice: 'Finishgood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finishgood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finishgoods/1
  # DELETE /finishgoods/1.json
  def destroy
    @finishgood = Finishgood.find(params[:id])
    @finishgood.destroy

    respond_to do |format|
      format.html { redirect_to finishgoods_url }
      format.json { head :no_content }
    end
  end
  
  def update_multiple
    @finishgood = Finishgood.find(params[:finishgoods_ptime].keys)
    
    @finishgood.each do |fg|  
      Rails.logger.debug("My object: #{fg.inspect}")
      fg.production.plannedtime = params[:finishgoods_ptime][fg.ukey]
      fg.production.scrap = params[:finishgoods_scrap][fg.ukey]
      fg.production.staff = params[:finishgoods_staff][fg.ukey]
      fg.save
    end
    redirect_to finishgoods_path({:proddate => params[:proddate]})
  end
  
  def show_productiondetail
    @finishgood = Finishgood.find(params[:id])
    @finishgoodreason = Productionreason.productionreason_default
    @productiondetails = @finishgood.production.productiondetails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finishgood }
    end
  end
end
