# frozen_string_literal: true

ActiveAdmin.register Ad do
  actions :all, except: %i[create new]
  scope :moderating
  member_action :approve, method: :patch do
    resource.approve!
    redirect_back fallback_location: root_path
  end
  member_action :reject, method: :patch do
    resource.reject!
    redirect_back fallback_location: root_path
  end

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :state
    column :created_at
    actions defaults: false do |ad|
      link_to 'Approve', approve_admin_ad_path(ad), method: :patch if ad.moderating?
    end
    actions defaults: false do |ad|
      link_to 'Reject', reject_admin_ad_path(ad), method: :patch if ad.moderating?
    end
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :user_id, :state
  #
  # or
  #

  # permit_params do
  #   permitted = [:title, :content, :user_id, :state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
