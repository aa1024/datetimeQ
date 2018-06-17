/# @name dtf Datetime Formatter
/# @package lib

/# @desc [excel format](https://support.office.com/en-us/article/format-a-date-the-way-you-want-8e10019e-d5d8-47a1-ba95-db95123d273e)

\d .dtf

months:string `January`February`March`April`May`June`July`August`September`October`November`December;
monthMap:(1+til 12)!months;
days:string `Sunday`Monday`Tuesday`Wednesday`Thursday`Friday`Saturday;
/split:"/ -,";      / @bullet Currently supports these 4 separators : "/" , " ", "," & "-"
excelMap:`m`mm`mmm`mmmm`d`dd`ddd`dddd`yy`yyyy!`m`mm`mmm`mmmm`d`dd`ddd`dddd`yy`yyyy;
nop:{'"error"}

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





/# @function m Returns Months as 1-12 
/#    @param x Date to be formatted   
/#    @return month 
m:{string`int$`mm$x}
/# @code q)m[2018.06.08]

/# @function mm Returns Months as 1-12 
/#    @param x Date to be formatted   
/#    @return month 
mm:{"0"^-2$string`mm$x}
/# @code q)mm[2018.06.08]

/# @function mmm Months as Jan-Dec 
/#    @param x Date to be formatted   
/#    @return month 
mmm:{3#mmmm[x]}
/# @code q)mmm[2018.06.08]

/# @function mmmm Months as January-December 
/#    @param x Date to be formatted   
/#    @return month 
mmmm:{monthMap[`mm$x]}
/# @code q)mmmm[2018.06.08]

/# @function mmmmm Months as the first letter of the month
/#    @param x Date to be formatted   
/#    @return month 
mmmmm:{1#mmmm[x]}
/# @code q)mmmmm[2018.06.08]

/# @function d Days as 1-31  
/#    @param x Date to be formatted   
/#    @return Date 
d:{string`int$`dd$x}
/# @code q)d[2018.06.08]


/# @function dd Days as 01-31  
/#    @param x Date to be formatted   
/#    @return Date 
dd:{"0"^-2$string`dd$x}
/# @code q)dd[2018.06.08]

/# @function ddddd Days as Sunday-Saturday 
/#    @param x Date to be formatted   
/#    @return Day of the week 
dddd:{days@mod[system["W"]+x-`week$x;7]}
/# @code q)system"W 4"; dddd[2018.06.08]; system"W 2"
/# @code q)system"W 0"; dddd[2018.06.08]; system"W 2"


/# @function ddddd Returns Returns Days as Sun-Sat 
/#    @param x Date to be formatted   
/#    @return Day of the week 
ddd:{3#days@mod[system["W"]+x-`week$x;7]}
/# @code q)system"W 4"; ddd[2018.06.08]; system"W 2"
/# @code q)system"W 0"; ddd[2018.06.08]; system"W 2"


/# @function m Returns Years as 1900-2099 
/#    @param x Date to be formatted   
/#    @return year 
yyyy:{string`year$x}
/# @code q)yyyy[2018.06.08]

/# @function m Returns Years as 00-99 
/#    @param x Date to be formatted   
/#    @return year 
yy:{-2#yyyy@x}
/# @code q)yy[2018.06.08]


