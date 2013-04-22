class SlittersController < ApplicationController
  # GET /slitters
  # GET /slitters.json
  def index
    @staffs = Staff.slitter
    
    if params[:slitteddate] && params[:slitteddate] != "Select a date"
      @slitters = Slitter.where(:sortdate => Date.parse(params[:slitteddate]).beginning_of_day..Date.parse(params[:slitteddate]).end_of_day)
    else
      @slitters = Slitter.pastweek
    end
    
    @slitters.each do |sl|
        if !sl.production
          sl.production = Production.new
        end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slitters }
    end
  end

  # GET /slitters/1
  # GET /slitters/1.json
  def show
    @slitter = Slitter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slitter }
    end
  end

  # GET /slitters/new
  # GET /slitters/new.json
  def new
    @slitter = Slitter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slitter }
    end
  end

  # GET /slitters/1/edit
  def edit
    @slitter = Slitter.find(params[:id])
  end

  # POST /slitters
  # POST /slitters.json
  def create
    @slitter = Slitter.new(params[:slitter])

    respond_to do |format|
      if @slitter.save
        format.html { redirect_to @slitter, notice: 'Slitter was successfully created.' }
        format.json { render json: @slitter, status: :created, location: @slitter }
      else
        format.html { render action: "new" }
        format.json { render json: @slitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slitters/1
  # PUT /slitters/1.json
  def update
    @slitter = Slitter.find(params[:id])

    respond_to do |format|
      if @slitter.update_attributes(params[:slitter])
        format.html { redirect_to @slitter, notice: 'Slitter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slitters/1
  # DELETE /slitters/1.json
  def destroy
    @slitter = Slitter.find(params[:id])
    @slitter.destroy

    respond_to do |format|
      format.html { redirect_to slitters_url }
      format.json { head :no_content }
    end
  end
  
  def update_multiple
    @slitters = Slitter.find(params[:slitter_ptime].keys)
    
    @slitters.each do |sl|  
      sl.production.plannedtime = params[:slitter_ptime][sl.slukey]
      sl.production.staff = params[:slitter_staff][sl.slukey]
      sl.save
    end
    redirect_to slitters_path({:proddate => params[:proddate]})
  end
  
  def show_productiondetail
    @slitters = Slitter.find(params[:id])
    @slittersreason = Productionreason.productionreason_sl
    @productiondetails = @slitters.production.productiondetails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finishgood }
    end
  end
end
