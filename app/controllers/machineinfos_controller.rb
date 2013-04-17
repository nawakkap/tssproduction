class MachineinfosController < ApplicationController
  # GET /machineinfos
  # GET /machineinfos.json
  def index
    @machineinfos = Machineinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machineinfos }
    end
  end

  # GET /machineinfos/1
  # GET /machineinfos/1.json
  def show
    @machineinfo = Machineinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machineinfo }
    end
  end

  # GET /machineinfos/new
  # GET /machineinfos/new.json
  def new
    @machineinfo = Machineinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machineinfo }
    end
  end

  # GET /machineinfos/1/edit
  def edit
    @machineinfo = Machineinfo.find(params[:id])
  end

  # POST /machineinfos
  # POST /machineinfos.json
  def create
    @machineinfo = Machineinfo.new(params[:machineinfo])

    respond_to do |format|
      if @machineinfo.save
        format.html { redirect_to @machineinfo, notice: 'Machineinfo was successfully created.' }
        format.json { render json: @machineinfo, status: :created, location: @machineinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @machineinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machineinfos/1
  # PUT /machineinfos/1.json
  def update
    @machineinfo = Machineinfo.find(params[:id])

    respond_to do |format|
      if @machineinfo.update_attributes(params[:machineinfo])
        format.html { redirect_to @machineinfo, notice: 'Machineinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machineinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machineinfos/1
  # DELETE /machineinfos/1.json
  def destroy
    @machineinfo = Machineinfo.find(params[:id])
    @machineinfo.destroy

    respond_to do |format|
      format.html { redirect_to machineinfos_url }
      format.json { head :no_content }
    end
  end
end
