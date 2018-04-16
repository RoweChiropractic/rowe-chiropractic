class InquiriesController < ApplicationController
  before_action :set_active_nav_link

  def create
    @inquiry = Inquiry.new inquiry_params
    @cms_page = CmsPage.find_by(slug: 'contact-us')
    if @inquiry.save
      flash[:message] = I18n.t('contact_form.success')
      UserMailer.new_inquiry(@inquiry).deliver_later
      redirect_to cms_page_path(@cms_page)
    else
      flash[:error] = 'Erro'
      render 'cms_pages/show'
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :name,
      :first_name,
      :last_name,
      :phone,
      :email,
      :comment,
      :preferred_appointment_time,
      :preferred_contact_time,
      :preferred_contact_method
    )
  end

  def set_active_nav_link
    @contact_link_active = true
  end
end
