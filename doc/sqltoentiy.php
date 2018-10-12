<?
//数据表导入实体图


$pdo=new pdo('mysql:host=127.0.0.1;dbname=trade_online','root','root');
$arr=$pdo->query('show tables ')->fetchAll();

$y=0;
foreach ($arr  as $key => $value) {
    
    $n=$value[0];

    $info=$pdo->query("desc ".$value[0])->fetchAll();
    $v='';
    $h=40+count($info)*15;
    foreach ($info as $key => $value2) {
        $v.= $value2['Field']."\n";
    }
    $y+=$h;
    $xml=' <node id="n'.$key.'">
      <data key="d5"/>
      <data key="d6">
        <y:GenericNode configuration="com.yworks.entityRelationship.big_entity">
          <y:Geometry height="'.$h.'.0" width="180.0" x="290.0" y="'.$y.'.0"/>
          <y:Fill color="#E8EEF7" color2="#B7C9E3" transparent="false"/>
          <y:BorderStyle color="#000000" type="line" width="1.0"/>
          <y:NodeLabel alignment="center" autoSizePolicy="content" backgroundColor="#B7C9E3" configuration="com.yworks.entityRelationship.label.name" fontFamily="Dialog" fontSize="12" fontStyle="plain" hasLineColor="false" height="18.1328125" modelName="internal" modelPosition="t" textColor="#000000" visible="true" width="108.876953125" x="24.5615234375" y="4.0">'.$n.'</y:NodeLabel>
          <y:NodeLabel alignment="left" autoSizePolicy="content" configuration="com.yworks.entityRelationship.label.attributes" fontFamily="Dialog" fontSize="12" fontStyle="plain" hasBackgroundColor="false" hasLineColor="false" height="60.53125" modelName="custom" textColor="#000000" visible="true" width="72.876953125" x="2.0" y="30.1328125">'.$v.'<y:LabelModel>
              <y:ErdAttributesNodeLabelModel/>
            </y:LabelModel>
            <y:ModelParameter>
              <y:ErdAttributesNodeLabelModelParameter/>
            </y:ModelParameter>
          </y:NodeLabel>
          <y:StyleProperties>
            <y:Property class="java.lang.Boolean" name="y.view.ShadowNodePainter.SHADOW_PAINTING" value="true"/>
          </y:StyleProperties>
        </y:GenericNode>
      </data>
    </node>';
    echo  $xml;
}
