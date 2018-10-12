<?
$sqls=file_get_contents("php://stdin");
$arr=explode("\n",$sqls);
$table='';
$cache=array();
foreach($arr as $line ){

    if(stristr($line,'create table')){
        preg_match('~\s+([^\s]+?)\s*\(~', $line,$info);
            
            if($info){
                $table=$info[1];
                $cache[$table]=array();
                continue;
            }

    }
    if(stristr($line,';') || stristr($line,'PRIMARY KEY')){
        $table='';
    }
    if($table){
        $info2=explode(" ", trim($line));
        
        if($info2){
            $cache[$table][$info2[0]]='';
            $info3=explode("#", trim($line),2);
            if(count($info3)>1){
                $cache[$table][$info2[0]]=$info3[1];
            }
        }
    }
}
print_r($cache);