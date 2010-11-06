require 'rexml/document'

namespace :db do
  desc "Fill Styles table with BJCP style data"
  task :styles => :environment do
    load_styles_table
  end
end

def load_styles_table
  xml = File.new('lib/tasks/styleguide.xml')
  doc = REXML::Document.new(xml)
  doc.elements.each('styleguide/class') do |c|
    if c.attributes['type'] == 'beer'
      c.elements.each('category/subcategory') do |s|
        # create Style objects here
        puts "Adding " + s.elements['name'].text.strip
        name = s.elements['name'].text.gsub(/\n/,"")
        aroma = s.elements['aroma'].text.gsub(/\n/,"")
        appearance = s.elements['appearance'].text.gsub(/\n/,"")
        flavor = s.elements['flavor'].text.gsub(/\n/,"")
        mouthfeel = s.elements['mouthfeel'].text.gsub(/\n/,"")
        Style.create!(:name => name)
      end
    end
  end
end
