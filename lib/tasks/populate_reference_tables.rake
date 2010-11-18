require 'rexml/document'

namespace :db do
  desc "Populate States, Countries, and Styles tables with reference data. Use after loading schema."
  task :lookups => :environment do
    load_styles_table
    load_states_table
    load_countries_table
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

def load_states_table
  State.create :name => 'Alabama', :abbreviation => 'AL'
  State.create :name => 'Alaska', :abbreviation => 'AK'
  State.create :name => 'Arizona', :abbreviation => 'AZ'
  State.create :name => 'Arkansas', :abbreviation => 'AR'
  State.create :name => 'California', :abbreviation => 'CA'
  State.create :name => 'Colorado', :abbreviation => 'CO'
  State.create :name => 'Connecticut', :abbreviation => 'CT'
  State.create :name => 'Delaware', :abbreviation => 'DE'
  State.create :name => 'District of Columbia', :abbreviation => 'DC'
  State.create :name => 'Florida', :abbreviation => 'FL'
  State.create :name => 'Georgia', :abbreviation => 'GA'
  State.create :name => 'Hawaii', :abbreviation => 'HI'
  State.create :name => 'Idaho', :abbreviation => 'ID'
  State.create :name => 'Illinois', :abbreviation => 'IL'
  State.create :name => 'Indiana', :abbreviation => 'IN'
  State.create :name => 'Iowa', :abbreviation => 'IA'
  State.create :name => 'Kansas', :abbreviation => 'KS'
  State.create :name => 'Kentucky', :abbreviation => 'KY'
  State.create :name => 'Louisiana', :abbreviation => 'LA'
  State.create :name => 'Maine', :abbreviation => 'ME'
  State.create :name => 'Maryland', :abbreviation => 'MD'
  State.create :name => 'Massachutsetts', :abbreviation => 'MA'
  State.create :name => 'Michigan', :abbreviation => 'MI'
  State.create :name => 'Minnesota', :abbreviation => 'MN'
  State.create :name => 'Mississippi', :abbreviation => 'MS'
  State.create :name => 'Missouri', :abbreviation => 'MO'
  State.create :name => 'Montana', :abbreviation => 'MT'
  State.create :name => 'Nebraska', :abbreviation => 'NE'
  State.create :name => 'Nevada', :abbreviation => 'NV'
  State.create :name => 'New Hampshire', :abbreviation => 'NH'
  State.create :name => 'New Jersey', :abbreviation => 'NJ'
  State.create :name => 'New Mexico', :abbreviation => 'NM'
  State.create :name => 'New York', :abbreviation => 'NY'
  State.create :name => 'North Carolina', :abbreviation => 'NC'
  State.create :name => 'North Dakota', :abbreviation => 'ND'
  State.create :name => 'Ohio', :abbreviation => 'OH'
  State.create :name => 'Oklahoma', :abbreviation => 'OK'
  State.create :name => 'Oregon', :abbreviation => 'OR'
  State.create :name => 'Pennsylvania', :abbreviation => 'PA'
  State.create :name => 'Rhode Island', :abbreviation => 'RI'
  State.create :name => 'South Carolina', :abbreviation => 'SC'
  State.create :name => 'South Dakota', :abbreviation => 'SD'
  State.create :name => 'Tennessee', :abbreviation => 'TN'
  State.create :name => 'Texas', :abbreviation => 'TX'
  State.create :name => 'Utah', :abbreviation => 'UT'
  State.create :name => 'Vermont', :abbreviation => 'VT'
  State.create :name => 'Virginia', :abbreviation => 'VA'
  State.create :name => 'Washington', :abbreviation => 'WA'
  State.create :name => 'West Virginia', :abbreviation => 'WV'
  State.create :name => 'Wisconsin', :abbreviation => 'WI'
  State.create :name => 'Wyoming', :abbreviation => 'WY'
end

def load_countries_table
  Country.create(:iso => 'AF', :name => 'Afghanistan', :iso3 => 'AFG', :numcode => '004') 
  Country.create(:iso => 'AL', :name => 'Albania', :iso3 => 'ALB', :numcode => '008') 
  Country.create(:iso => 'DZ', :name => 'Algeria', :iso3 => 'DZA', :numcode => '012') 
  Country.create(:iso => 'AS', :name => 'American Samoa', :iso3 => 'ASM', :numcode => '016') 
  Country.create(:iso => 'AD', :name => 'Andorra', :iso3 => 'AND', :numcode => '020') 
  Country.create(:iso => 'AO', :name => 'Angola', :iso3 => 'AGO', :numcode => '024') 
  Country.create(:iso => 'AI', :name => 'Anguilla', :iso3 => 'AIA', :numcode => '660') 
  Country.create(:iso => 'AG', :name => 'Antigua and Barbuda', :iso3 => 'ATG', :numcode => '028') 
  Country.create(:iso => 'AR', :name => 'Argentina', :iso3 => 'ARG', :numcode => '032') 
  Country.create(:iso => 'AM', :name => 'Armenia', :iso3 => 'ARM', :numcode => '051') 
  Country.create(:iso => 'AW', :name => 'Aruba', :iso3 => 'ABW', :numcode => '533') 
  Country.create(:iso => 'AU', :name => 'Australia', :iso3 => 'AUS', :numcode => '036') 
  Country.create(:iso => 'AT', :name => 'Austria', :iso3 => 'AUT', :numcode => '040') 
  Country.create(:iso => 'AZ', :name => 'Azerbaijan', :iso3 => 'AZE', :numcode => '031') 
  Country.create(:iso => 'BS', :name => 'Bahamas', :iso3 => 'BHS', :numcode => '044') 
  Country.create(:iso => 'BH', :name => 'Bahrain', :iso3 => 'BHR', :numcode => '048') 
  Country.create(:iso => 'BD', :name => 'Bangladesh', :iso3 => 'BGD', :numcode => '050') 
  Country.create(:iso => 'BB', :name => 'Barbados', :iso3 => 'BRB', :numcode => '052') 
  Country.create(:iso => 'BY', :name => 'Belarus', :iso3 => 'BLR', :numcode => '112') 
  Country.create(:iso => 'BE', :name => 'Belgium', :iso3 => 'BEL', :numcode => '056') 
  Country.create(:iso => 'BZ', :name => 'Belize', :iso3 => 'BLZ', :numcode => '084') 
  Country.create(:iso => 'BJ', :name => 'Benin', :iso3 => 'BEN', :numcode => '204') 
  Country.create(:iso => 'BM', :name => 'Bermuda', :iso3 => 'BMU', :numcode => '060') 
  Country.create(:iso => 'BT', :name => 'Bhutan', :iso3 => 'BTN', :numcode => '064') 
  Country.create(:iso => 'BO', :name => 'Bolivia', :iso3 => 'BOL', :numcode => '068') 
  Country.create(:iso => 'BA', :name => 'Bosnia and Herzegovina', :iso3 => 'BIH', :numcode => '070') 
  Country.create(:iso => 'BW', :name => 'Botswana', :iso3 => 'BWA', :numcode => '072') 
  Country.create(:iso => 'BR', :name => 'Brazil', :iso3 => 'BRA', :numcode => '076') 
  Country.create(:iso => 'BN', :name => 'Brunei Darussalam', :iso3 => 'BRN', :numcode => '096') 
  Country.create(:iso => 'BG', :name => 'Bulgaria', :iso3 => 'BGR', :numcode => '100') 
  Country.create(:iso => 'BF', :name => 'Burkina Faso', :iso3 => 'BFA', :numcode => '854') 
  Country.create(:iso => 'BI', :name => 'Burundi', :iso3 => 'BDI', :numcode => '108') 
  Country.create(:iso => 'KH', :name => 'Cambodia', :iso3 => 'KHM', :numcode => '116') 
  Country.create(:iso => 'CM', :name => 'Cameroon', :iso3 => 'CMR', :numcode => '120') 
  Country.create(:iso => 'CA', :name => 'Canada', :iso3 => 'CAN', :numcode => '124') 
  Country.create(:iso => 'CV', :name => 'Cape Verde', :iso3 => 'CPV', :numcode => '132') 
  Country.create(:iso => 'KY', :name => 'Cayman Islands', :iso3 => 'CYM', :numcode => '136') 
  Country.create(:iso => 'CF', :name => 'Central African Republic', :iso3 => 'CAF', :numcode => '140') 
  Country.create(:iso => 'TD', :name => 'Chad', :iso3 => 'TCD', :numcode => '148') 
  Country.create(:iso => 'CL', :name => 'Chile', :iso3 => 'CHL', :numcode => '152') 
  Country.create(:iso => 'CN', :name => 'China', :iso3 => 'CHN', :numcode => '156') 
  Country.create(:iso => 'CO', :name => 'Colombia', :iso3 => 'COL', :numcode => '170') 
  Country.create(:iso => 'KM', :name => 'Comoros', :iso3 => 'COM', :numcode => '174') 
  Country.create(:iso => 'CG', :name => 'Congo', :iso3 => 'COG', :numcode => '178') 
  Country.create(:iso => 'CD', :name => 'Congo, the Democratic Republic of the', :iso3 => 'COD', :numcode => '180') 
  Country.create(:iso => 'CK', :name => 'Cook Islands', :iso3 => 'COK', :numcode => '184') 
  Country.create(:iso => 'CR', :name => 'Costa Rica', :iso3 => 'CRI', :numcode => '188') 
  Country.create(:iso => 'CI', :name => 'Cote D\'Ivoire', :iso3 => 'CIV', :numcode => '384') 
  Country.create(:iso => 'HR', :name => 'Croatia', :iso3 => 'HRV', :numcode => '191') 
  Country.create(:iso => 'CU', :name => 'Cuba', :iso3 => 'CUB', :numcode => '192') 
  Country.create(:iso => 'CY', :name => 'Cyprus', :iso3 => 'CYP', :numcode => '196') 
  Country.create(:iso => 'CZ', :name => 'Czech Republic', :iso3 => 'CZE', :numcode => '203') 
  Country.create(:iso => 'DK', :name => 'Denmark', :iso3 => 'DNK', :numcode => '208') 
  Country.create(:iso => 'DJ', :name => 'Djibouti', :iso3 => 'DJI', :numcode => '262') 
  Country.create(:iso => 'DM', :name => 'Dominica', :iso3 => 'DMA', :numcode => '212') 
  Country.create(:iso => 'DO', :name => 'Dominican Republic', :iso3 => 'DOM', :numcode => '214') 
  Country.create(:iso => 'EC', :name => 'Ecuador', :iso3 => 'ECU', :numcode => '218') 
  Country.create(:iso => 'EG', :name => 'Egypt', :iso3 => 'EGY', :numcode => '818') 
  Country.create(:iso => 'SV', :name => 'El Salvador', :iso3 => 'SLV', :numcode => '222') 
  Country.create(:iso => 'GQ', :name => 'Equatorial Guinea', :iso3 => 'GNQ', :numcode => '226') 
  Country.create(:iso => 'ER', :name => 'Eritrea', :iso3 => 'ERI', :numcode => '232') 
  Country.create(:iso => 'EE', :name => 'Estonia', :iso3 => 'EST', :numcode => '233') 
  Country.create(:iso => 'ET', :name => 'Ethiopia', :iso3 => 'ETH', :numcode => '231') 
  Country.create(:iso => 'FK', :name => 'Falkland Islands (Malvinas)', :iso3 => 'FLK', :numcode => '238') 
  Country.create(:iso => 'FO', :name => 'Faroe Islands', :iso3 => 'FRO', :numcode => '234') 
  Country.create(:iso => 'FJ', :name => 'Fiji', :iso3 => 'FJI', :numcode => '242') 
  Country.create(:iso => 'FI', :name => 'Finland', :iso3 => 'FIN', :numcode => '246') 
  Country.create(:iso => 'FR', :name => 'France', :iso3 => 'FRA', :numcode => '250') 
  Country.create(:iso => 'GF', :name => 'French Guiana', :iso3 => 'GUF', :numcode => '254') 
  Country.create(:iso => 'PF', :name => 'French Polynesia', :iso3 => 'PYF', :numcode => '258') 
  Country.create(:iso => 'GA', :name => 'Gabon', :iso3 => 'GAB', :numcode => '266') 
  Country.create(:iso => 'GM', :name => 'Gambia', :iso3 => 'GMB', :numcode => '270') 
  Country.create(:iso => 'GE', :name => 'Georgia', :iso3 => 'GEO', :numcode => '268') 
  Country.create(:iso => 'DE', :name => 'Germany', :iso3 => 'DEU', :numcode => '276') 
  Country.create(:iso => 'GH', :name => 'Ghana', :iso3 => 'GHA', :numcode => '288') 
  Country.create(:iso => 'GI', :name => 'Gibraltar', :iso3 => 'GIB', :numcode => '292') 
  Country.create(:iso => 'GR', :name => 'Greece', :iso3 => 'GRC', :numcode => '300') 
  Country.create(:iso => 'GL', :name => 'Greenland', :iso3 => 'GRL', :numcode => '304') 
  Country.create(:iso => 'GD', :name => 'Grenada', :iso3 => 'GRD', :numcode => '308') 
  Country.create(:iso => 'GP', :name => 'Guadeloupe', :iso3 => 'GLP', :numcode => '312') 
  Country.create(:iso => 'GU', :name => 'Guam', :iso3 => 'GUM', :numcode => '316') 
  Country.create(:iso => 'GT', :name => 'Guatemala', :iso3 => 'GTM', :numcode => '320') 
  Country.create(:iso => 'GN', :name => 'Guinea', :iso3 => 'GIN', :numcode => '324') 
  Country.create(:iso => 'GW', :name => 'Guinea-Bissau', :iso3 => 'GNB', :numcode => '624') 
  Country.create(:iso => 'GY', :name => 'Guyana', :iso3 => 'GUY', :numcode => '328') 
  Country.create(:iso => 'HT', :name => 'Haiti', :iso3 => 'HTI', :numcode => '332') 
  Country.create(:iso => 'VA', :name => 'Holy See (Vatican City State)', :iso3 => 'VAT', :numcode => '336') 
  Country.create(:iso => 'HN', :name => 'Honduras', :iso3 => 'HND', :numcode => '340') 
  Country.create(:iso => 'HK', :name => 'Hong Kong', :iso3 => 'HKG', :numcode => '344') 
  Country.create(:iso => 'HU', :name => 'Hungary', :iso3 => 'HUN', :numcode => '348') 
  Country.create(:iso => 'IS', :name => 'Iceland', :iso3 => 'ISL', :numcode => '352') 
  Country.create(:iso => 'IN', :name => 'India', :iso3 => 'IND', :numcode => '356') 
  Country.create(:iso => 'ID', :name => 'Indonesia', :iso3 => 'IDN', :numcode => '360') 
  Country.create(:iso => 'IR', :name => 'Iran, Islamic Republic of', :iso3 => 'IRN', :numcode => '364') 
  Country.create(:iso => 'IQ', :name => 'Iraq', :iso3 => 'IRQ', :numcode => '368') 
  Country.create(:iso => 'IE', :name => 'Ireland', :iso3 => 'IRL', :numcode => '372') 
  Country.create(:iso => 'IL', :name => 'Israel', :iso3 => 'ISR', :numcode => '376') 
  Country.create(:iso => 'IT', :name => 'Italy', :iso3 => 'ITA', :numcode => '380') 
  Country.create(:iso => 'JM', :name => 'Jamaica', :iso3 => 'JAM', :numcode => '388') 
  Country.create(:iso => 'JP', :name => 'Japan', :iso3 => 'JPN', :numcode => '392') 
  Country.create(:iso => 'JO', :name => 'Jordan', :iso3 => 'JOR', :numcode => '400') 
  Country.create(:iso => 'KZ', :name => 'Kazakhstan', :iso3 => 'KAZ', :numcode => '398') 
  Country.create(:iso => 'KE', :name => 'Kenya', :iso3 => 'KEN', :numcode => '404') 
  Country.create(:iso => 'KI', :name => 'Kiribati', :iso3 => 'KIR', :numcode => '296') 
  Country.create(:iso => 'KP', :name => 'Korea, Democratic People\'s Republic of', :iso3 => 'PRK', :numcode => '408') 
  Country.create(:iso => 'KR', :name => 'Korea, Republic of', :iso3 => 'KOR', :numcode => '410') 
  Country.create(:iso => 'KW', :name => 'Kuwait', :iso3 => 'KWT', :numcode => '414') 
  Country.create(:iso => 'KG', :name => 'Kyrgyzstan', :iso3 => 'KGZ', :numcode => '417') 
  Country.create(:iso => 'LA', :name => 'Lao People\'s Democratic Republic', :iso3 => 'LAO', :numcode => '418') 
  Country.create(:iso => 'LV', :name => 'Latvia', :iso3 => 'LVA', :numcode => '428') 
  Country.create(:iso => 'LB', :name => 'Lebanon', :iso3 => 'LBN', :numcode => '422') 
  Country.create(:iso => 'LS', :name => 'Lesotho', :iso3 => 'LSO', :numcode => '426') 
  Country.create(:iso => 'LR', :name => 'Liberia', :iso3 => 'LBR', :numcode => '430') 
  Country.create(:iso => 'LY', :name => 'Libyan Arab Jamahiriya', :iso3 => 'LBY', :numcode => '434') 
  Country.create(:iso => 'LI', :name => 'Liechtenstein', :iso3 => 'LIE', :numcode => '438') 
  Country.create(:iso => 'LT', :name => 'Lithuania', :iso3 => 'LTU', :numcode => '440') 
  Country.create(:iso => 'LU', :name => 'Luxembourg', :iso3 => 'LUX', :numcode => '442') 
  Country.create(:iso => 'MO', :name => 'Macao', :iso3 => 'MAC', :numcode => '446') 
  Country.create(:iso => 'MK', :name => 'Macedonia, the Former Yugoslav Republic of', :iso3 => 'MKD', :numcode => '807') 
  Country.create(:iso => 'MG', :name => 'Madagascar', :iso3 => 'MDG', :numcode => '450') 
  Country.create(:iso => 'MW', :name => 'Malawi', :iso3 => 'MWI', :numcode => '454') 
  Country.create(:iso => 'MY', :name => 'Malaysia', :iso3 => 'MYS', :numcode => '458') 
  Country.create(:iso => 'MV', :name => 'Maldives', :iso3 => 'MDV', :numcode => '462') 
  Country.create(:iso => 'ML', :name => 'Mali', :iso3 => 'MLI', :numcode => '466') 
  Country.create(:iso => 'MT', :name => 'Malta', :iso3 => 'MLT', :numcode => '470') 
  Country.create(:iso => 'MH', :name => 'Marshall Islands', :iso3 => 'MHL', :numcode => '584') 
  Country.create(:iso => 'MQ', :name => 'Martinique', :iso3 => 'MTQ', :numcode => '474') 
  Country.create(:iso => 'MR', :name => 'Mauritania', :iso3 => 'MRT', :numcode => '478') 
  Country.create(:iso => 'MU', :name => 'Mauritius', :iso3 => 'MUS', :numcode => '480') 
  Country.create(:iso => 'MX', :name => 'Mexico', :iso3 => 'MEX', :numcode => '484') 
  Country.create(:iso => 'FM', :name => 'Micronesia, Federated States of', :iso3 => 'FSM', :numcode => '583') 
  Country.create(:iso => 'MD', :name => 'Moldova, Republic of', :iso3 => 'MDA', :numcode => '498') 
  Country.create(:iso => 'MC', :name => 'Monaco', :iso3 => 'MCO', :numcode => '492') 
  Country.create(:iso => 'MN', :name => 'Mongolia', :iso3 => 'MNG', :numcode => '496') 
  Country.create(:iso => 'MS', :name => 'Montserrat', :iso3 => 'MSR', :numcode => '500') 
  Country.create(:iso => 'MA', :name => 'Morocco', :iso3 => 'MAR', :numcode => '504') 
  Country.create(:iso => 'MZ', :name => 'Mozambique', :iso3 => 'MOZ', :numcode => '508') 
  Country.create(:iso => 'MM', :name => 'Myanmar', :iso3 => 'MMR', :numcode => '104') 
  Country.create(:iso => 'NA', :name => 'Namibia', :iso3 => 'NAM', :numcode => '516') 
  Country.create(:iso => 'NR', :name => 'Nauru', :iso3 => 'NRU', :numcode => '520') 
  Country.create(:iso => 'NP', :name => 'Nepal', :iso3 => 'NPL', :numcode => '524') 
  Country.create(:iso => 'NL', :name => 'Netherlands', :iso3 => 'NLD', :numcode => '528') 
  Country.create(:iso => 'AN', :name => 'Netherlands Antilles', :iso3 => 'ANT', :numcode => '530') 
  Country.create(:iso => 'NC', :name => 'New Caledonia', :iso3 => 'NCL', :numcode => '540') 
  Country.create(:iso => 'NZ', :name => 'New Zealand', :iso3 => 'NZL', :numcode => '554') 
  Country.create(:iso => 'NI', :name => 'Nicaragua', :iso3 => 'NIC', :numcode => '558') 
  Country.create(:iso => 'NE', :name => 'Niger', :iso3 => 'NER', :numcode => '562') 
  Country.create(:iso => 'NG', :name => 'Nigeria', :iso3 => 'NGA', :numcode => '566') 
  Country.create(:iso => 'NU', :name => 'Niue', :iso3 => 'NIU', :numcode => '570') 
  Country.create(:iso => 'NF', :name => 'Norfolk Island', :iso3 => 'NFK', :numcode => '574') 
  Country.create(:iso => 'MP', :name => 'Northern Mariana Islands', :iso3 => 'MNP', :numcode => '580') 
  Country.create(:iso => 'NO', :name => 'Norway', :iso3 => 'NOR', :numcode => '578') 
  Country.create(:iso => 'OM', :name => 'Oman', :iso3 => 'OMN', :numcode => '512') 
  Country.create(:iso => 'PK', :name => 'Pakistan', :iso3 => 'PAK', :numcode => '586') 
  Country.create(:iso => 'PW', :name => 'Palau', :iso3 => 'PLW', :numcode => '585') 
  Country.create(:iso => 'PA', :name => 'Panama', :iso3 => 'PAN', :numcode => '591') 
  Country.create(:iso => 'PG', :name => 'Papua New Guinea', :iso3 => 'PNG', :numcode => '598') 
  Country.create(:iso => 'PY', :name => 'Paraguay', :iso3 => 'PRY', :numcode => '600') 
  Country.create(:iso => 'PE', :name => 'Peru', :iso3 => 'PER', :numcode => '604') 
  Country.create(:iso => 'PH', :name => 'Philippines', :iso3 => 'PHL', :numcode => '608') 
  Country.create(:iso => 'PN', :name => 'Pitcairn', :iso3 => 'PCN', :numcode => '612') 
  Country.create(:iso => 'PL', :name => 'Poland', :iso3 => 'POL', :numcode => '616') 
  Country.create(:iso => 'PT', :name => 'Portugal', :iso3 => 'PRT', :numcode => '620') 
  Country.create(:iso => 'PR', :name => 'Puerto Rico', :iso3 => 'PRI', :numcode => '630') 
  Country.create(:iso => 'QA', :name => 'Qatar', :iso3 => 'QAT', :numcode => '634') 
  Country.create(:iso => 'RE', :name => 'Reunion', :iso3 => 'REU', :numcode => '638') 
  Country.create(:iso => 'RO', :name => 'Romania', :iso3 => 'ROM', :numcode => '642') 
  Country.create(:iso => 'RU', :name => 'Russian Federation', :iso3 => 'RUS', :numcode => '643') 
  Country.create(:iso => 'RW', :name => 'Rwanda', :iso3 => 'RWA', :numcode => '646') 
  Country.create(:iso => 'SH', :name => 'Saint Helena', :iso3 => 'SHN', :numcode => '654') 
  Country.create(:iso => 'KN', :name => 'Saint Kitts and Nevis', :iso3 => 'KNA', :numcode => '659') 
  Country.create(:iso => 'LC', :name => 'Saint Lucia', :iso3 => 'LCA', :numcode => '662') 
  Country.create(:iso => 'PM', :name => 'Saint Pierre and Miquelon', :iso3 => 'SPM', :numcode => '666') 
  Country.create(:iso => 'VC', :name => 'Saint Vincent and the Grenadines', :iso3 => 'VCT', :numcode => '670') 
  Country.create(:iso => 'WS', :name => 'Samoa', :iso3 => 'WSM', :numcode => '882') 
  Country.create(:iso => 'SM', :name => 'San Marino', :iso3 => 'SMR', :numcode => '674') 
  Country.create(:iso => 'ST', :name => 'Sao Tome and Principe', :iso3 => 'STP', :numcode => '678') 
  Country.create(:iso => 'SA', :name => 'Saudi Arabia', :iso3 => 'SAU', :numcode => '682') 
  Country.create(:iso => 'SN', :name => 'Senegal', :iso3 => 'SEN', :numcode => '686') 
  Country.create(:iso => 'SC', :name => 'Seychelles', :iso3 => 'SYC', :numcode => '690') 
  Country.create(:iso => 'SL', :name => 'Sierra Leone', :iso3 => 'SLE', :numcode => '694') 
  Country.create(:iso => 'SG', :name => 'Singapore', :iso3 => 'SGP', :numcode => '702') 
  Country.create(:iso => 'SK', :name => 'Slovakia', :iso3 => 'SVK', :numcode => '703') 
  Country.create(:iso => 'SI', :name => 'Slovenia', :iso3 => 'SVN', :numcode => '705') 
  Country.create(:iso => 'SB', :name => 'Solomon Islands', :iso3 => 'SLB', :numcode => '090') 
  Country.create(:iso => 'SO', :name => 'Somalia', :iso3 => 'SOM', :numcode => '706') 
  Country.create(:iso => 'ZA', :name => 'South Africa', :iso3 => 'ZAF', :numcode => '710') 
  Country.create(:iso => 'ES', :name => 'Spain', :iso3 => 'ESP', :numcode => '724') 
  Country.create(:iso => 'LK', :name => 'Sri Lanka', :iso3 => 'LKA', :numcode => '144') 
  Country.create(:iso => 'SD', :name => 'Sudan', :iso3 => 'SDN', :numcode => '736') 
  Country.create(:iso => 'SR', :name => 'Suriname', :iso3 => 'SUR', :numcode => '740') 
  Country.create(:iso => 'SJ', :name => 'Svalbard and Jan Mayen', :iso3 => 'SJM', :numcode => '744') 
  Country.create(:iso => 'SZ', :name => 'Swaziland', :iso3 => 'SWZ', :numcode => '748') 
  Country.create(:iso => 'SE', :name => 'Sweden', :iso3 => 'SWE', :numcode => '752') 
  Country.create(:iso => 'CH', :name => 'Switzerland', :iso3 => 'CHE', :numcode => '756') 
  Country.create(:iso => 'SY', :name => 'Syrian Arab Republic', :iso3 => 'SYR', :numcode => '760') 
  Country.create(:iso => 'TW', :name => 'Taiwan, Province of China', :iso3 => 'TWN', :numcode => '158') 
  Country.create(:iso => 'TJ', :name => 'Tajikistan', :iso3 => 'TJK', :numcode => '762') 
  Country.create(:iso => 'TZ', :name => 'Tanzania, United Republic of', :iso3 => 'TZA', :numcode => '834') 
  Country.create(:iso => 'TH', :name => 'Thailand', :iso3 => 'THA', :numcode => '764') 
  Country.create(:iso => 'TG', :name => 'Togo', :iso3 => 'TGO', :numcode => '768') 
  Country.create(:iso => 'TK', :name => 'Tokelau', :iso3 => 'TKL', :numcode => '772') 
  Country.create(:iso => 'TO', :name => 'Tonga', :iso3 => 'TON', :numcode => '776') 
  Country.create(:iso => 'TT', :name => 'Trinidad and Tobago', :iso3 => 'TTO', :numcode => '780') 
  Country.create(:iso => 'TN', :name => 'Tunisia', :iso3 => 'TUN', :numcode => '788') 
  Country.create(:iso => 'TR', :name => 'Turkey', :iso3 => 'TUR', :numcode => '792') 
  Country.create(:iso => 'TM', :name => 'Turkmenistan', :iso3 => 'TKM', :numcode => '795') 
  Country.create(:iso => 'TC', :name => 'Turks and Caicos Islands', :iso3 => 'TCA', :numcode => '796') 
  Country.create(:iso => 'TV', :name => 'Tuvalu', :iso3 => 'TUV', :numcode => '798') 
  Country.create(:iso => 'UG', :name => 'Uganda', :iso3 => 'UGA', :numcode => '800') 
  Country.create(:iso => 'UA', :name => 'Ukraine', :iso3 => 'UKR', :numcode => '804') 
  Country.create(:iso => 'AE', :name => 'United Arab Emirates', :iso3 => 'ARE', :numcode => '784') 
  Country.create(:iso => 'GB', :name => 'United Kingdom', :iso3 => 'GBR', :numcode => '826') 
  Country.create(:iso => 'US', :name => 'United States', :iso3 => 'USA', :numcode => '840') 
  Country.create(:iso => 'UY', :name => 'Uruguay', :iso3 => 'URY', :numcode => '858') 
  Country.create(:iso => 'UZ', :name => 'Uzbekistan', :iso3 => 'UZB', :numcode => '860') 
  Country.create(:iso => 'VU', :name => 'Vanuatu', :iso3 => 'VUT', :numcode => '548') 
  Country.create(:iso => 'VE', :name => 'Venezuela', :iso3 => 'VEN', :numcode => '862') 
  Country.create(:iso => 'VN', :name => 'Viet Nam', :iso3 => 'VNM', :numcode => '704') 
  Country.create(:iso => 'VG', :name => 'Virgin Islands, British', :iso3 => 'VGB', :numcode => '092') 
  Country.create(:iso => 'VI', :name => 'Virgin Islands, U.s.', :iso3 => 'VIR', :numcode => '850') 
  Country.create(:iso => 'WF', :name => 'Wallis and Futuna', :iso3 => 'WLF', :numcode => '876') 
  Country.create(:iso => 'EH', :name => 'Western Sahara', :iso3 => 'ESH', :numcode => '732') 
  Country.create(:iso => 'YE', :name => 'Yemen', :iso3 => 'YEM', :numcode => '887') 
  Country.create(:iso => 'ZM', :name => 'Zambia', :iso3 => 'ZMB', :numcode => '894') 
  Country.create(:iso => 'ZW', :name => 'Zimbabwe', :iso3 => 'ZWE', :numcode => '716') 
end
