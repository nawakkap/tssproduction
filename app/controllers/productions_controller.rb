class ProductionsController < ApplicationController
  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productions }
    end
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
    @production = Production.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production }
    end
  end

  # GET /productions/new
  # GET /productions/new.json
  def new
    @production = Production.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production }
    end
  end

  # GET /productions/1/edit
  def edit
    @production = Production.find(params[:id])
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(params[:production])

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render json: @production, status: :created, location: @production }
      else
        format.html { render action: "new" }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productions/1
  # PUT /productions/1.json
  def update
    @production = Production.find(params[:id])

    respond_to do |format|
      if @production.update_attributes(params[:production])
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production = Production.find(params[:id])
    @production.destroy

    respond_to do |format|
      format.html { redirect_to productions_url }
      format.json { head :no_content }
    end
  end
  
  def update_multiple
    @production = Production.find(params[:production_id])
    @finishgoodreason = Productionreason.productionreason_default
    
    @finishgoodreason.each do |fr|
      if p = @production.productiondetails.find_by_productionreason_id(fr.seq)
        p.time = params[:productiondetail_time][fr.seq.to_s].to_f*5
        p.remark = params[:productiondetail_remark][fr.seq.to_s]
        p.save
      else
        @production.productiondetails << Productiondetail.create(:productionreason_id => fr.seq, 
                                                                 :time => params[:productiondetail_time][fr.seq.to_s].to_f*5,
                                                                 :remark => params[:productiondetail_remark][fr.seq.to_s])
      end
    end
    
    redirect_to show_productiondetail_finishgood_path({:id => @production.fg_ukey})
  end
end
