/# @name dtf Datetime Formatter
/# @package lib

/# @see https://support.office.com/en-us/article/format-a-date-the-way-you-want-8e10019e-d5d8-47a1-ba95-db95123d273e

\d .dtf

months:string `January`February`March`April`May`June`July`August`September`October`November`December;
monthsMap:(1+til 12)!months;
days:`Monday`Tuesday`Wednesday`Thursday`Friday`Saturday`Sunday;
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



