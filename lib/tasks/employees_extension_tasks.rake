namespace :radiant do
  namespace :extensions do
    namespace :employees do
      
      desc "Runs the migration of the Employees extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          EmployeesExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          EmployeesExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Employees to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from EmployeesExtension"
        Dir[EmployeesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(EmployeesExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
