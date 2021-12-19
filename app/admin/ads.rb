# frozen_string_literal: true

ActiveAdmin.register Ad do
  actions :all, except: %i[create new delete update]
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
  end

  permit_params :title, :content, :user_id, :state
end
