/# @name dtf Datetime Formatter
/# @package lib

/# @desc [excel format](https://support.office.com/en-us/article/format-a-date-the-way-you-want-8e10019e-d5d8-47a1-ba95-db95123d273e)

\d .dtf

months:string `January`February`March`April`May`June`July`August`September`October`November`December;
monthMap:(1+til 12)!months;
days:string `Sunday`Monday`Tuesday`Wednesday`Thursday`Friday`Saturday;
/split:"/ -,";      / @bullet Currently supports these 4 separators : "/" , " ", "," & "-"
excelMap:`m`mm`mmm`mmmm`d`dd`ddd`dddd`yy`yyyy`h`hh`H`HH`u`uu`s`ss`o`oo`O`OO`0`00`000!`.dtf.m`.dtf.mm`.dtf.mmm`.dtf.mmmm`.dtf.d`.dtf.dd`.dtf.ddd`.dtf.dddd`.dtf.yy`.dtf.yyyy`.dtf.h`.dtf.hh`.dtf.h1`.dtf.hh1`.dtf.u`.dtf.uu`.dtf.s`.dtf.ss1`.dtf.ap`.dtf.ampm`.dtf.ap0`.dtf.ampm0`.dtf.ms1`.dtf.ms2`.dtf.ms3;
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
/Hours as 0-23                               h
/Hours as 00-23                              hh
/Minutes as 0-59                             m
/Minutes as 00-59                            mm
/Seconds as 0-59                             s
/Seconds as 00-59                            ss  
/Time as 4 AM                                h AM/PM
/Time as 4:36 PM                             h:mm AM/PM
/Time as 4:36:03 P                           h:mm:ss A/P
/Time as 4:36:03.75                          h:mm:ss.00

	
/# @function format Format the date as per the given date format 
/#    @param f Date formatter e.g. "dd-mm-yyyy"   
/#    @param dt Date to be formatted   
/#    @return Formatted date

apList:(("AM/PM";"OO");("A/P";"O");("am/pm";"oo");("a/p";"o"));

format:{[fmt;dt]
    f:fmt;
    if[a:any oi:f like/:("*AM/PM*";"*A/P*";"*am/pm*";"*a/p*"); f:{ssr[x; y 0; y 1]}[f ] apList first where oi; f:ssr[f;"h";"H"]];
    vf:lower[f] inter  .Q.a; /,"0";
    it:except[`$cut[where differ vf;vf];key excelMap];
    
    if[count it;'"Unrecognized char passed for formatting"];
    tkns:cut[where differ f;f];
    raze {[op;dt]@[value `.dtf.nop^excelMap@`$op;dt;op] }[;dt] each tkns
 };

/# @code q).dtf.format[fmt:"d/m/yyyy"; dt:2018.06.08] 
/# @code q).dtf.format["d mmmm, dddd ,yyyy"; 2018.06.18]
/# @code q).dtf.format[fmt:"yy-mm-dd hh:uu:ss.000"; 2018.06.08T01:02:03.456]
/# @code q)do[1000;.dtf.format[fmt:"yy-mm-dd hh:uu:ss.000 AM/PM"; dt:2018.06.08T21:02:03.456]]


/# @function m Returns Months as 1-12 
/#    @param x Date to be formatted   
/#    @return PMnth 
m:{string`int$`mm$x}
/# @code q).dtf.m[2018.06.08]

/# @function mm Returns Months as 1-12 
/#    @param x Date to be formatted   
/#    @return month 
mm:{"0"^-2$string`mm$x}
/# @code q).dtf.mm[2018.06.08]

/# @function mmm Months as Jan-Dec 
/#    @param x Date to be formatted   
/#    @return month 
mmm:{3#mmmm[x]}
/# @code q).dtf.mmm[2018.06.08]

/# @function mmmm Months as January-December 
/#    @param x Date to be formatted   
/#    @return month 
mmmm:{monthMap[`mm$x]}
/# @code q).dtf.mmmm[2018.06.08]

/# @function mmmmm Months as the first letter of the month
/#    @param x Date to be formatted   
/#    @return month 
mmmmm:{1#mmmm[x]}
/# @code q).dtf.mmmmm[2018.06.08]

/# @function d Days as 1-31  
/#    @param x Date to be formatted   
/#    @return Date 
d:{string`int$`dd$x}
/# @code q).dtf.d[2018.06.08]


/# @function dd Days as 01-31  
/#    @param x Date to be formatted   
/#    @return Date 
dd:{"0"^-2$string`dd$x}
/# @code q).dtf.dd[2018.06.08]

/# @function ddddd To get Days as Sunday-Saturday 
/#    @param x Date to be formatted   
/#    @return Day of the week 
dddd:{days@mod[system["W"]+x-`week$x;7]}
/# @code q)system"W 4"; .dtf.dddd[2018.06.08]; system"W 2"
/# @code q)system"W 0"; .dtf.dddd[2018.06.08]; system"W 2"


/# @function ddddd To get Days as Sun-Sat 
/#    @param x Date to be formatted   
/#    @return Day of the week 
ddd:{3#days@mod[system["W"]+x-`week$x;7]}
/# @code q)system"W 4"; .dtf.ddd[2018.06.08]; system"W 2"
/# @code q)system"W 0"; .dtf.ddd[2018.06.08]; system"W 2"


/# @function m To get Years as 1900-2099 
/#    @param x Date to be formatted   
/#    @return year 
yyyy:{string`year$x}
/# @code q).dtf.yyyy[2018.06.08]

/# @function m To get Years as 00-99 
/#    @param x Date to be formatted   
/#    @return year 
yy:{-2#yyyy@x}
/# @code q).dtf.yy[2018.06.08]


/# @function h To get Hours as 0-23 
/#    @param x Date to be formatted   
/#    @return Hours 
h:{`hh$x}
/# @code q).dtf.h 01:05:21

/# @function hh To get Hours as 00-23 
/#    @param x Date to be formatted   
/#    @return Hours 
hh:{"0"^-2$string h@x}
/# @code q).dtf.hh 01:05:21

/# @function h1 To get Hours as 1-12 
/#    @param x Date to be formatted   
/#    @return Hours 
h1:{mod[`hh$x;12]}
/# @code q).dtf.h1 01:05:21
/# @code q).dtf.h1 21:05:21

/# @function hh1 To get Hours as 01-12 
/#    @param x Date to be formatted   
/#    @return Hours 
hh1:{"0"^-2$string h1[x]}
/# @code q).dtf.hh1 01:05:21
/# @code q).dtf.hh1 21:05:21


/# @function u To get Minutes as 0-59 
/#    @param x Date to be formatted   
/#    @return Minutes 
u:{`uu$x}
/# @code q).dtf.u x:21:05:21.123

/# @function uu To get Minutes as 00-59 
/#    @param x Date to be formatted   
/#    @return Minutes 
uu:{"0"^-2$string`uu$x}
/# @code q).dtf.uu 01:05:21


/# @function s To get Seconds as 0-59 
/#    @param x Date to be formatted   
/#    @return seconds 
s:{`ss$x}
/# @code q).dtf.s x:01:05:21

/# @function ss1 To get Seconds as 00-59 
/#    @param x Date to be formatted   
/#    @return seconds 
ss1:{"0"^-2$string`ss$x}
/# @code q).dtf.ss1 01:05:21

/# @function ampm0 To get Time as 4 AM 
/#    @param x Date to be formatted   
/#    @return AM/PM 
ampm0:{ $[<[`hh$x;12] ; "AM";"PM"] }
/# @code q).dtf.ampm0[21:05:21]

/# @function ap0 To get Time as 4 A 
/#    @param x Date to be formatted   
/#    @return A/P 
ap0:{1#ampm0@x}
/# @code q).dtf.ap0[21:05:21]

/# @function ampm To get Time as 4 am 
/#    @param x Date to be formatted   
/#    @return am/pm
ampm:{lower ampm0@x}
/# @code q).dtf.ampm[21:05:21]

/# @function ap To get Time as 4 a   (a/p)
/#    @param x Date to be formatted   
/#    @return a/p
ap:{lower 1#ampm0@x}
/# @code q).dtf.ap[21:05:21]

/# @function ms3 To get 3 digits millisecond precision
/#    @param x Date to be formatted   
/#    @return milliseconds 
ms3:{3$string mod[`int$`time$x;1000]}
/# @code q).dtf.ms3[x:21:05:21.123]

/# @function ms2 To get 2 digits millisecond precision 
/#    @param x Date to be formatted   
/#    @return milliseconds 
ms2:{2$string mod[`int$`time$x;1000]}
/# @code q).dtf.ms2[x:21:05:21.123]

/# @function ms1 To get 1 digit millisecond precision
/#    @param x Date to be formatted   
/#    @return millisecond 
ms1:{1$string mod[`int$`time$x;1000]}
/# @code q).dtf.ms1[x:21:05:21.123]




