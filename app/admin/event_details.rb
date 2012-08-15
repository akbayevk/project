ActiveAdmin.register EventDetail do
index do
  column :title
  column :description
  column "Start Date", :from
  column "End Date", :to
  column "Created Date", :created_at
  default_actions
end  
end
