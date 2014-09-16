ActiveAdmin.register CollegeCoach do

  permit_params :verified, :disabled
  
  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :last_name
      f.input :verified
      f.input :disabled
    end
      
    f.actions
  end
    
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  #permit_params :verified

  index do 
    column :email
    column :last_sign_in_at
    column :verified
    column :diabled
    actions
  end
  
end
