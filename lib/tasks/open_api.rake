namespace :open_api do
  task today_construction: :environment do
    Project.import_today_construction
  end
end
