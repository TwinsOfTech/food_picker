class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.get(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.get(params[:user_id].to_i) || User.new
    if @user.present? && @user.saved?
      session['user_id'] = @user.id
      redirect_to '/'
    else
      @user.name = params[:name]
      if @user.save
        session['user_id'] = @user.id
        redirect_to '/'
      else
        redirect_to '/', :alert => 'Error creating user. Did you choose a name?'
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.get(params[:id])

    respond_to do |format|
      if @user.update(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.get(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
