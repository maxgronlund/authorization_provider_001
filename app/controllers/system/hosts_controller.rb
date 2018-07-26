class System::HostsController < ApplicationController
  before_action :set_system_host, only: [:show, :edit, :update, :destroy]

  # GET /system/hosts
  # GET /system/hosts.json
  def index
    @system_hosts = System::Host.all
  end

  # GET /system/hosts/1
  # GET /system/hosts/1.json
  def show
  end

  # GET /system/hosts/new
  def new
    @system_host = System::Host.new
  end

  # GET /system/hosts/1/edit
  def edit
  end

  # POST /system/hosts
  # POST /system/hosts.json
  def create
    @system_host = System::Host.new(system_host_params)

    respond_to do |format|
      if @system_host.save
        format.html { redirect_to @system_host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @system_host }
      else
        format.html { render :new }
        format.json { render json: @system_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system/hosts/1
  # PATCH/PUT /system/hosts/1.json
  def update
    respond_to do |format|
      if @system_host.update(system_host_params)
        format.html { redirect_to @system_host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_host }
      else
        format.html { render :edit }
        format.json { render json: @system_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system/hosts/1
  # DELETE /system/hosts/1.json
  def destroy
    @system_host.destroy
    respond_to do |format|
      format.html { redirect_to system_hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_host
      @system_host = System::Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_host_params
      params.require(:system_host).permit(:name, :url, :default)
    end
end
