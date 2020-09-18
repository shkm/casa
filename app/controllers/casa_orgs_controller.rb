class CasaOrgsController < ApplicationController
  before_action :set_casa_org, only: %i[edit update]
  before_action :must_be_admin

  def edit
  end

  def update
    respond_to do |format|
      if @casa_org.update(casa_org_update_params)
        format.html { redirect_to edit_casa_org_path, notice: "CASA organization was successfully updated." }
        format.json { render :show, status: :ok, location: @casa_org }
      else
        format.html { render :edit }
        format.json { render json: @casa_org.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_casa_org
    @casa_org = current_organization
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def casa_org_update_params
    params.require(:casa_org).permit(:name, :display_name, :address)
  end
end