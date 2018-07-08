.settings.baseFolder:".";

import:{ x:(),x; r:0N!x!.sys.importLib each x;:r};
.sys.importLib:{@[ { value "\\l ", .settings.baseFolder,"/libs/",string[x],".q";1b} ;x;{show x;0b}]};


import `dtf;



show .dtf.format[fmt:"d/m/yyyy"; dt:2018.06.08];
show .dtf.format["d mmmm, dddd ,yyyy"; 2018.06.18];
show .dtf.format[fmt:"yy-mm-dd hh:uu:ss.000"; 2018.06.08T01:02:03.456];
