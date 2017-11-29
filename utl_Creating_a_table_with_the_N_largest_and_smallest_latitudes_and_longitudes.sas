Creating a table with the N largest and smallest latitudes and longitudes for the US and territories

INPUT  ( latitudes and longitudes for the US and territories )
==============================================================

  WORK.HAVE total obs=41,267

  ZIPCODE    LONGITUDE    LATITUDE

   00501      40.8131     -73.0464
   00544      40.8132     -73.0493
   00601      18.1660     -66.7236
   00602      18.3830     -67.1866
   00603      18.4332     -67.1520
   00604      18.5053     -67.1359
   00605      18.4361     -67.1513
 ....


PROCESS
=======

  ods exclude all;
  ods output ExtremeObs=want;
  proc univariate data=have
    /* n extreme obs */ NEXTROBS=5;
  var longitude latitude;
  id zipcode;
  run;quit;
  ods select all;


OUTPUT
======

 Note the latitude is zero equator and logitude is 0 aft the prime meridian

 WORK.WANT total obs=60                LATITUDE
                                       ========

                                        ZIPCODE_                          ZIPCODE_
    VARNAME          LOW      LOW       LOWOBS        HIGH      HIGH      HIGHOBS

   LONGITUDE       0.000     73960       31341      65.842     99727       41174
   LONGITUDE       0.000     46213       19271      65.975     99745       41190
   LONGITUDE       0.000     46197       19260      66.024     99774       41219
   LONGITUDE       0.000     35270       14767      66.040     99772       41217
   LONGITUDE       0.000     34441       14451      66.094     99741       41186


                                       LONGITUDE
                                       ========

                                        ZIPCODE_                          ZIPCODE_
    VARNAME          LOW      LOW       LOWOBS        HIGH      HIGH      HIGHOBS
   LATITUDE     -176.659     99546       41022     -64.704     00824         119
   LATITUDE     -174.429     99547       41023       0.000     34441       14451
   LATITUDE     -171.429     99742       41187       0.000     35270       14767
   LATITUDE     -170.273     99660       41117       0.000     46197       19260
   LATITUDE     -169.860     99638       41097       0.000     46213       19271
   LATITUDE     -169.621     99591       41062       0.000     73960       31341

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data have;
 retain zipcode;
 set sashelp.zipcode(
         keep=x y zip
         rename=(x=latitude y=longitude)
       );
 zipcode=put(zip,z5.);
 drop zip;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

ods exclude all;
ods output ExtremeObs=want;
proc univariate data=have
  /* n extreme obs */ NEXTROBS=5;
var longitude latitude;
id zipcode;
run;quit;
ods select all;



 Note the latitude is zero equator and logitude is 0 aft the prime meridian

 WORK.WANT total obs=60                LATITUDE
                                       ========

                                        ZIPCODE_                          ZIPCODE_
    VARNAME          LOW      LOW       LOWOBS        HIGH      HIGH      HIGHOBS

   LONGITUDE       0.000     73960       31341      65.842     99727       41174
   LONGITUDE       0.000     46213       19271      65.975     99745       41190
   LONGITUDE       0.000     46197       19260      66.024     99774       41219
   LONGITUDE       0.000     35270       14767      66.040     99772       41217
   LONGITUDE       0.000     34441       14451      66.094     99741       41186


                                       LONGITUDE
                                       ========

                                        ZIPCODE_                          ZIPCODE_
    VARNAME          LOW      LOW       LOWOBS        HIGH      HIGH      HIGHOBS
   LATITUDE     -176.659     99546       41022     -64.704     00824         119
   LATITUDE     -174.429     99547       41023       0.000     34441       14451
   LATITUDE     -171.429     99742       41187       0.000     35270       14767
   LATITUDE     -170.273     99660       41117       0.000     46197       19260
   LATITUDE     -169.860     99638       41097       0.000     46213       19271
   LATITUDE     -169.621     99591       41062       0.000     73960       31341



