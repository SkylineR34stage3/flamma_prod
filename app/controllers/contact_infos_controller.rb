class ContactInfosController < ApplicationController
  def index
    @contact_infos = ContactInfo.all
  end

  def show
    @contact_info = ContactInfo.find(params[:id])
  end

  def new
    @contact_info = ContactInfo.new
  end

  def create
    @contact_info = ContactInfo.new(contact_info_params)

    if @contact_info.save
      redirect_to @contact_info, notice: 'Contact info was successfully created.'
    else
      render :new
    end
  end

  def edit
    @contact_info = ContactInfo.find(params[:id])
  end

  def update
    @contact_info = ContactInfo.find(params[:id])

    if @contact_info.update(contact_info_params)
      redirect_to @contact_info, notice: 'Contact info was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact_info = ContactInfo.find(params[:id])
    @contact_info.destroy

    redirect_to contact_infos_url, notice: 'Contact info was successfully destroyed.'
  end

  private

  def contact_info_params
    params.require(:contact_info).permit(:telegram_id, :phone)
  end
end
