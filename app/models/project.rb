class Project < ActiveRecord::Base

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :items, class_name: "ProjectItem"

  def self.import_today_construction
    json_obj = OpenApi.today_construction_obj

    json_obj.each do |item|
      if item["APPMODE"] == "0"
        if Project.where(project_serial: item["AC_NO"]).blank?
          project = Project.create(published_at: self.convert_app_time_to_datetime(item["APPTIME"]),
                                title: item["NPURP"], address: item["ADDR"], project_serial: item["AC_NO"],
                                description: self.get_description_from_today_construction_item(item))
        end
      end
    end
  rescue ActiveRecord::RecordNotFound => e
  end

  def self.get_description_from_today_construction_item(item)
    fields = ["核備文號: #{item["AC_NO"]}", "序號: #{item["SNO"]}", "施工單位: #{item["APP_NAME"]}",
              "行政區: #{item["C_NAME"]}", "核准施工起日: #{item["CB_DA"]}", "核准施工迄日: #{item["CE_DA"]}",
              "施工時段: #{item["CO_TI"]}", "監工: #{item["TC_MA"]}", "監工電話: #{item["TC_TL"]}",
              "廠商現場施工人員: #{item["TC_MA3"]}", "現場施工人員手機: #{item["TC_TL3"]}"]
    fields.map { |field| "<p>#{field}<p>" }.join("")
  end

  def self.convert_app_time_to_datetime(app_time)
    _app_time = app_time.to_s
    DateTime.new(*(([_app_time[0..2]] + _app_time[3..-1].scan(/.{2}/)).map(&:to_i))).change(offset: "+0800")
  end
end
