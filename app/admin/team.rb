ActiveAdmin.register Team do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :country, :rank

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :country, :as => :string
      f.input :rank
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
