Uwezo: Test scores, by district, for Tanzania 
=======

24 February 2015. Choropleth maps of test scores, by district, for Tanzania. 2013 data.



### To Do
1. ~~Adapt Uwezo/Kenya/preschool choropleth code.~~
2. ~~Prep the data in `csv` form.~~
3. Static version(s).
4. ~~Buttons for English, Swahili, Math.~~
5. ~~`topoJSON` the Tanzania district shapefiles.~~
6. ~~Turn off event listeners as map is fading in.~~ (Didn't work.)
7. ~~Color scale: color-blind-safe?~~ (Uwezo standards.)
8. ~~Make a list of all districts that didn't name-merge.~~
9. ~~Fix the rural/urban name-merge fails (some have "urban" but not "rural").~~
10. ~~Fix the "Township Authority" name-merge fails.~~
11. ~~Remaining name-merge fails!~~ (Trying the 2002 district boundaries.)
12. ~~Use 2002 geo data instead.~~
13. ~~Use Zaida's data.~~
14. ~~Design stuff.~~
15. ~~4-level color scheme. Back to it!~~
16. Different highlight color.
17. ~~`swahili` landing.~~
18. ~~Add title.~~
19. ~~Change titles so that it's 0% - 24%, etc.~~ 


### Notes on GeoJSON/TopoJSON

(So I don't forget how I did it. To keep some record.)

_Making the GeoJSON_:

	ogr2ogr -f GeoJSON tz.json ../_data/tz-gis/Districts.shp

_Making the TopoJSON_:

	topojson -o tz_compressed.json --id-property District_N tz.json


### Resources

* Reference: [Command line reference (about topoJSON)](https://github.com/mbostock/topojson/wiki/Command-Line-Reference)


