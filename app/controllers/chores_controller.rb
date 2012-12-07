class ChoresController < ApplicationController
  
  attr_accessor :completed
  before_filter :authenticate_user!
  
  # GET /chores
  # GET /chores.json
  def index
    @chores = Chore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chores }
    end
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
    @chore = Chore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chore }
    end
  end

  # GET /chores/new
  # GET /chores/new.json
  def new
    @chore = Chore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chore }
    end
  end

  # GET /chores/1/edit
  def edit
    @chore = Chore.find(params[:id])
  end

  # POST /chores
  # POST /chores.json
  def create
    @child = Child.find(params[:child_id])
    @chore = @child.chores.new(params[:chore])

    respond_to do |format|
      if @chore.save
        format.html { redirect_to child_url(@child), notice: 'Chore was successfully created.' }
        #figure out the json l8ter
      else
        format.html { redirect_to child_url(@child) }
        #figure out the json l8ter
      end
    end
  end

  # PUT /chores/1
  # PUT /chores/1.json
  def update
    @chore = Chore.find(params[:id])

    respond_to do |format|
      if @chore.update_attributes(params[:chore])
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    respond_to do |format|
      format.html { redirect_to chores_url }
      format.json { head :no_content }
    end
  end
  
  def complete
    @child = Child.find(params[:children_id])
    @chore = @child.chores.find(params[:id])
    @chore.completed = true
    @chore.save
    redirect_to child_url(@child)
  end
  
  
  def delete
    @child = Child.find(params[:children_id])
    @chore = @child.chores.find(params[:id])
    @chore.destroy
    redirect_to child_url(@child)
  end
  
  
end 


  
  
  
 
  































