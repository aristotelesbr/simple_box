# frozen_string_literal
class SalesController < ApplicationController
  def index
    @sales = Sale.order(created_at: 'DESC')
  end

  def new
    @import = Services::UploadFile.new
  end

  def create
    @import = Services::UploadFile.new(sale_params)
    if @import.save
      redirect_to root_path, notice: t('flash.sales.create.notice')
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:services_upload_file).permit(:file)
  end
end
