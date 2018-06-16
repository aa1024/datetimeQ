/# @name dtf Datetime Formatter
/# @package lib

/# @see https://support.office.com/en-us/article/format-a-date-the-way-you-want-8e10019e-d5d8-47a1-ba95-db95123d273e

\d .dtf

months:string `January`February`March`April`May`June`July`August`September`October`November`December;
monthMap:(1+til 12)!months;
days:string `Sunday`Monday`Tuesday`Wednesday`Thursday`Friday`Saturday;
split:"/ -,";      /# @bullet Currently supports these 4 separators : "/" , " ", "," & "-"

/To display                                  Use this code
/Months as 1-12                              m
/Months as 01-12                             mm
/Months as Jan-Dec                           mmm
/Months as January-December                  mmmm
/Months as the first letter of the month     mmmmm
/Days as 1-31                                d
/Days as 01-31                               dd
/Days as Sun-Sat                             ddd
/Days as Sunday-Saturday                     dddd
/Years as 00-99                              yy
/Years as 1900-9999                          yyyy

m:{string`int$`mm$x}
m[.z.d]

mm:{string`mm$x}
mm[.z.d]

mmm:{3#mmmm[x]}
mmm[.z.d]

mmmm:{monthMap[`mm$x]}
mmmm[.z.d]

mmmmm:{1#mmmm[x]}
mmmmm[.z.d]


d:{string`int$`dd$x}
d[.z.d-10]

dd:{string`dd$x}
dd[.z.d]

dddd:{days@mod[system["W"]+x-`week$x;7]}
/system"W 4"; dddd[2018.06.14]; system"W 2"
/system"W 0"; dddd[2018.06.14]; system"W 2"

ddd:{3#days@mod[system["W"]+x-`week$x;7]}
/system"W 4"; ddd[2018.06.14]; system"W 2"
/system"W 0"; ddd[2018.06.14]; system"W 2"

/format:"dd/m/yyyy"
/tokens:cut[where differ format;format]



