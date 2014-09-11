ActiveAdmin.register ClubPlayer do
  permit_params :disabled

  index do 
    column :email
    column :first_name
    column :last_name
    column :club_team
    column :profile_name
    column :confirmed_at
    column :diabled
    column :last_sign_in_at
    actions
  end
end