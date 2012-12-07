class RewardsController < ApplicationController
  
  attr_accessor :rewarded
  before_filter :authenticate_user!
  
  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = Reward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
    @reward = Reward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
    @reward = Reward.find(params[:id])
  end

  # POST /rewards
  # POST /rewards.json
  def create
     @child = Child.find(params[:child_id])
     @reward = @child.rewards.new(params[:reward])

     respond_to do |format|
       if @reward.save
         format.html { redirect_to child_url(@child), notice: 'Reward was successfully created.' }
         #figure out the json l8ter
       else
         format.html { redirect_to child_url(@child) }
         #figure out the json l8ter
       end
     end
   end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
    @reward = Reward.find(params[:id])

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to child_url(@child) }
      format.json { head :no_content }
    end
  end
  
  def delete
    @child = Child.find(params[:children_id])
    @reward = @child.rewards.find(params[:id])
    @reward.destroy
    redirect_to child_url(@child)
  end
  
  def complete
    @child = Child.find(params[:children_id])
    @reward = @child.rewards.find(params[:id])
    @reward.rewarded = true
    @reward.save
    redirect_to child_url(@child)
  end
end
