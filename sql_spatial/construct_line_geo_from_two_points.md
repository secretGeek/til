# Construct line geography from two points

Got two points and want to draw a straight line between them?

    geography::STGeomFromText(
        'LINESTRING(' 
            + str(w1.Geo.Long,18,15) 
            + ' ' 
            + str(w1.Geo.Lat,18,15) 
            + ', ' 
            + str(w2.Geo.Long,18,15) 
            + ' ' 
            + str(w2.Geo.Lat,18,15) + ')', 
         w1.Geo.STSrid) AS NewGeo


     
Here it is again in a single easy to copy line....


    geography::STGeomFromText('LINESTRING(' + str(w1.Geo.Long,18,15) + ' ' + str(w1.Geo.Lat,18,15) + ', ' + str(w2.Geo.Long,18,15) + ' ' + str(w2.Geo.Lat,18,15) + ')', w1.Geo.STSrid) AS NewGeo


Remember though that the Earth is curved, and you'd better `densify` that if you want to use it for long lines.

And, if you want it to output the text, then add

    .AsTextZM()

...to the resulting geo.


