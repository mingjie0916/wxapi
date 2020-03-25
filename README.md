# wxapi
11111111111
22222222222
33333333333
 $company = Company::model()->find("cid={$cid}");
            //账号发送权限注册接口
            $bizedm = BizEdm::instance();
            if(trim($_POST['notice_email']) && $company->notice_email == ''){
                $bizedm->add(trim($_POST['notice_email']));
            }elseif (trim($_POST['notice_email']) && trim($_POST['notice_email']) != $company->notice_email){
                $bizedm->update(trim($_POST['notice_email']), $company->notice_email);
            }
