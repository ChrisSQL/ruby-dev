class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @user = User.find(current_user)
    @group = Group.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user = User.find(current_user)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  def new
    @user = User.find(current_user)
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # # POST /groups
  # # POST /groups.json
  # def create
  #   @user = User.find(current_user)
  #   @group = Group.new(group_params)
  #
  #   respond_to do |format|
  #     if @group.save
  #       format.html { redirect_to @group, notice: 'Group was successfully created.' }
  #       format.json { render json: @group, status: :created }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    if current_user.groups.create(group_params)
      flash[:success] = "Group Note created!"
      redirect_to groups_path
    else
      flash[:success] = "Group Note not created!"
      redirect_to groups_path
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:author_email, :note_subject, :note_details)
    end
end
