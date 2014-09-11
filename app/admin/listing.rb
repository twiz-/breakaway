ActiveAdmin.register Listing do
  permit_params :approved

  index do 
    column :video
    column :description
    column :club_player_id
    actions
  end
end