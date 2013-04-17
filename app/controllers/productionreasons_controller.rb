class ProductionreasonsController < ApplicationController
  # GET /productionreasons
  # GET /productionreasons.json
  def index
    @productionreasons = Productionreason.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productionreasons }
    end
  end

  # GET /productionreasons/1
  # GET /productionreasons/1.json
  def show
    @productionreason = Productionreason.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productionreason }
    end
  end

  # GET /productionreasons/new
  # GET /productionreasons/new.json
  def new
    @productionreason = Productionreason.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productionreason }
    end
  end

  # GET /productionreasons/1/edit
  def edit
    @productionreason = Productionreason.find(params[:id])
  end

  # POST /productionreasons
  # POST /productionreasons.json
  def create
    @productionreason = Productionreason.new(params[:productionreason])

    respond_to do |format|
      if @productionreason.save
        format.html { redirect_to @productionreason, notice: 'Productionreason was successfully created.' }
        format.json { render json: @productionreason, status: :created, location: @productionreason }
      else
        format.html { render action: "new" }
        format.json { render json: @productionreason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productionreasons/1
  # PUT /productionreasons/1.json
  def update
    @productionreason = Productionreason.find(params[:id])

    respond_to do |format|
      if @productionreason.update_attributes(params[:productionreason])
        format.html { redirect_to @productionreason, notice: 'Productionreason was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @productionreason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productionreasons/1
  # DELETE /productionreasons/1.json
  def destroy
    @productionreason = Productionreason.find(params[:id])
    @productionreason.destroy

    respond_to do |format|
      format.html { redirect_to productionreasons_url }
      format.json { head :no_content }
    end
  end
end
