import requests

import csv

url='http://fezz.in/whg/projects/data/tube-stops.json'
response = requests.get(url)
data = response.json()

Canarywharf_lat = data['Canary Wharf']['lat']
Canarywharf_lon = data['Canary Wharf']['lon']
Stratford_lat = data['Stratford']['lat']
Stratford_lon = data['Stratford']['lon']
Westham_lat = data['West Ham']['lat']
Westham_lon = data['West Ham']['lon']
# Canningtown_lat = data['Canning Town']['lat']
# Canningtown_lon = data['Canning Town']['lon']
NGreenwich_lat = data['North Greenwich']['lat']
NGreenwich_lon = data['North Greenwich']['lon']

Stratford_data = [ ['Stratford', Stratford_lat, Stratford_lon]]
# Canningtown_data = [ ['Canning Town', Canningtown_lat, Canningtown_lon]]
NGreenwich_data = [ ['North Greenwich', NGreenwich_lat, NGreenwich_lon]]
Westham_data= [ ['West Ham', Westham_lat, Westham_lon]]
Canarywharf_data = [ ['Canary Wharf', Canarywharf_lat, Canarywharf_lon]]

myFile = open('tube_stops.csv', 'w')
with myFile:
   writer = csv.writer(myFile)
   myFile.write('name,lat,lon\n')
   writer.writerows(Canarywharf_data)
   writer.writerows(NGreenwich_data)
   writer.writerows(Westham_data)
   writer.writerows(Stratford_data)



#what do i want to do? plot my tube journey!
# what order are the 5 stops in? from West to East - positive longitude direction
#Canary Wharf - North Greenwich - Canning Town - West Ham - Stratford

#since our area enclosed by these latitudes and longitudes is so small comparative to the Earth,
# we can treat it as a flat surface and map directly between
# Longitude and X. Latitude and Y.
#West to East is positive in X direction, similar to processing coordinate system
#North is positive in Y direction, South is negative in Y direction. opposite to Processing coordinate system
