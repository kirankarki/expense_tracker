require 'colorize'

namespace :index do 
    task :rebuild => :environment do
        %w{Budget Expense}.each do |class_name|
            print "*** #{class_name} ***\n"
            klass = class_name.constantize
            begin
                klass.searchkick_index.delete if klass.searchkick_index
                print "Existing index is cleared!\n".colorize(:green)
            rescue => e
                print "Index not found!\n".colorize(:red)
            end
            print "Indexing #{class_name}.....\n".colorize(:green)

            klass.reindex

            print "Successfully indexed\n\n".colorize(:green)
        end    
    end
end