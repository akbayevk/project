ActiveAdmin.register Character do
index do
    column :name
    column :address
    column :longitude
    column :latitude
    default_actions
  end  
end
