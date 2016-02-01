module ApplicationHelper

   def user_admin?
     current_user.admin?
   end

   def user_retailer?
     current_user.retailer?
   end

   def user_supplier?
     current_user.suupplier?
   end

   def full_name(user)
     user.first_name + " " + user.last_name
   end



def us_states
   [
     ['Alabama', 'AL'],
     ['Alaska', 'AK'],
     ['Arizona', 'AZ'],
     ['Arkansas', 'AR'],
     ['California', 'CA'],
     ['Colorado', 'CO'],
     ['Connecticut', 'CT'],
     ['Delaware', 'DE'],
     ['District of Columbia', 'DC'],
     ['Florida', 'FL'],
     ['Georgia', 'GA'],
     ['Hawaii', 'HI'],
     ['Idaho', 'ID'],
     ['Illinois', 'IL'],
     ['Indiana', 'IN'],
     ['Iowa', 'IA'],
     ['Kansas', 'KS'],
     ['Kentucky', 'KY'],
     ['Louisiana', 'LA'],
     ['Maine', 'ME'],
     ['Maryland', 'MD'],
     ['Massachusetts', 'MA'],
     ['Michigan', 'MI'],
     ['Minnesota', 'MN'],
     ['Mississippi', 'MS'],
     ['Missouri', 'MO'],
     ['Montana', 'MT'],
     ['Nebraska', 'NE'],
     ['Nevada', 'NV'],
     ['New Hampshire', 'NH'],
     ['New Jersey', 'NJ'],
     ['New Mexico', 'NM'],
     ['New York', 'NY'],
     ['North Carolina', 'NC'],
     ['North Dakota', 'ND'],
     ['Ohio', 'OH'],
     ['Oklahoma', 'OK'],
     ['Oregon', 'OR'],
     ['Pennsylvania', 'PA'],
     ['Puerto Rico', 'PR'],
     ['Rhode Island', 'RI'],
     ['South Carolina', 'SC'],
     ['South Dakota', 'SD'],
     ['Tennessee', 'TN'],
     ['Texas', 'TX'],
     ['Utah', 'UT'],
     ['Vermont', 'VT'],
     ['Virginia', 'VA'],
     ['Washington', 'WA'],
     ['West Virginia', 'WV'],
     ['Wisconsin', 'WI'],
     ['Wyoming', 'WY']
   ]
end

def fuel_type
  ['Regular', 'Plus', 'Super', 'Diesel']
end

def fuel_brands
  [
    'Amoco',
    'ARCO',
    'BP',
    'Chevron',
    'Circle K',
    'Citgo',
    'Clark Brands',
    'Costco',
    'Cumberland Farms',
    'Exxon',
    'Flying J',
    'Gas City, Ltd.',
    'Getty',
    'Go-Mar',
    'Gulf',
    'Hess',
    'High\'s Dairy Stores',
    'Holiday',
    'Irving Oil',
    'Kroger brand gasoline',
    'Kum & Go',
    'Kwik Trip',
    'Love\'s',
    'Lukoil',
    'Marathon Oil',
    'Mobil',
    'Murphy USA',
    'Phillips 66',
    'Pilot',
    'QuickChek',
    'QuikTrip',
    'RaceTrac/Raceway',
    'Shell',
    'Royal Farms',
    'Rutter\'s Farm Stores',
    '7-Eleven brand gasoline',
    '76',
    'Sam\'s Club',
    'Sheetz',
    'Sinclair',
    'Speedway',
    'Spinx',
    'Sunoco',
    'Texaco',
    'Travelcenters of America',
    'Valero',
    'Wawa'
]
end
end
