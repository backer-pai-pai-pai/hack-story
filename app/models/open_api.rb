class OpenApi
  TODAY_CONSTRUCTION_URL = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162"
  def initialize
    
  end

  def self.today_construction_obj
    rest_obj = RestClient.get(TODAY_CONSTRUCTION_URL)
    JSON.parse(rest_obj.to_s)["result"]["results"]
    # 核備文號(Ac_no),期數(St_no),序號(sno),通報類別(AppMode),X座標(X),Y座標(Y),通報時間(AppTime),施工單位(App_Name),行政區(C_Name),施工位置(Addr),核准施工起日(Cb_Da),核准施工迄日(Ce_Da),施工時段(Co_Ti),監工(Tc_Ma),監工電話(Tc_Tl),廠商現場施工人員(Tc_Ma3),現場施工人員手機(Tc_Tl3),挖掘目的(NPurp),逾時原因(DType)
  end
end
