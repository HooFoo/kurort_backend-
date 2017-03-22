ActiveAdmin.register PointType do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :icon, :point_options_attributes => [:id, :name, :type_name]
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
    f.inputs 'Point type' do
      f.input :name
      f.input :icon
    end
    f.inputs 'Point options' do
      f.has_many :point_options, heading: 'Themes', allow_destroy: true do |pof|
        pof.semantic_errors # shows errors on :base

        pof.input :name
        pof.input :type_name, as: :select, collection: PointOption::Types
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
