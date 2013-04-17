class ProductiondetailsController < ApplicationController
  # GET /productiondetails
  # GET /productiondetails.json
  def index
    @productiondetails = Productiondetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productiondetails }
    end
  end

  # GET /productiondetails/1
  # GET /productiondetails/1.json
  def show
    @productiondetail = Productiondetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productiondetail }
    end
  end

  # GET /productiondetails/new
  # GET /productiondetails/new.json
  def new
    @productiondetail = Productiondetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productiondetail }
    end
  end

  # GET /productiondetails/1/edit
  def edit
    @productiondetail = Productiondetail.find(params[:id])
  end

  # POST /productiondetails
  # POST /productiondetails.json
  def create
    @productiondetail = Productiondetail.new(params[:productiondetail])

    respond_to do |format|
      if @productiondetail.save
        format.html { redirect_to @productiondetail, notice: 'Productiondetail was successfully created.' }
        format.json { render json: @productiondetail, status: :created, location: @productiondetail }
      else
        format.html { render action: "new" }
        format.json { render json: @productiondetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productiondetails/1
  # PUT /productiondetails/1.json
  def update
    @productiondetail = Productiondetail.find(params[:id])

    respond_to do |format|
      if @productiondetail.update_attributes(params[:productiondetail])
        format.html { redirect_to @productiondetail, notice: 'Productiondetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @productiondetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productiondetails/1
  # DELETE /productiondetails/1.json
  def destroy
    @productiondetail = Productiondetail.find(params[:id])
    @productiondetail.destroy

    respond_to do |format|
      format.html { redirect_to productiondetails_url }
      format.json { head :no_content }
    end
  end
  
end
