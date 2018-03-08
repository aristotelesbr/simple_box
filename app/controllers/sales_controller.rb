# frozen_string_literal
class SalesController < ApplicationController
  def index
    @sales = Sale.order(created_at: 'DESC').page(params[:page])
  end

  def new
    @import = Services::UploadFile.new
  end

  def create
    @import = Services::UploadFile.new(sale_params)
    if @import.valid?
      @import.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: t('flash.sales.create.notice') }
      end
    end
  end

  private

  def sale_params
    params.require(:services_upload_file).permit(:file)
  end
end
