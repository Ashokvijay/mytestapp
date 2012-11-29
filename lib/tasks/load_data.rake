require 'csv'
desc "Load data from csv"
task :load => :"load:data"

namespace :load do
    desc "load players" 
    task :players => :environment do
      CSV.foreach("#{Rails.root}/doc/players.csv",{:headers => true}) do |row|
         position = Position.find_or_create_by_name(row['Position'].strip)
         Player.create!(:name => row['Player Name'].strip,:position => position)
      end
    end
    desc "load teams" 
    task :teams => :environment do
      CSV.foreach("#{Rails.root}/doc/teams.csv",{:headers => true}) do |row|
         division = Division.find_or_create_by_name(row['Division'].strip)
         Team.create!(:name => row['Team Name'].strip,:division => division)
      end
    end
    desc "load order" 
    task :order => :environment do
      CSV.foreach("#{Rails.root}/doc/order.csv",{:headers => true}) do |row|
        team =  Team.find_by_name(row['Team Name'].strip)
        DraftOrder.create!(:round => row['Round'],:pick => row['Pick'],:team => team)
      end
    end
    desc "load all" 
    task :all => [:players,:teams,:order] do
      CSV.foreach("#{Rails.root}/doc/order.csv",{:headers => true}) do |row|
            puts row
      end
    end
end


