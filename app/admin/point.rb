ActiveAdmin.register Point do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :lat, :lng, :name, :description, :options, :point_type_id, :user_id, :lang_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.actions         # adds the 'Submit' and 'Cancel' buttons
    f.semantic_errors # shows errors on :base
    f.inputs 'Point' do
      f.input :point_type
      f.input :user
      f.input :lang
      f.input :lat, label: 'Latitude'
      f.input :lng, label: 'Longitude'
      f.input :name
      f.input :description
      f.input :options, hint: 'JSON', as: :text
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
