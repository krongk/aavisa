class WelcomeController < ApplicationController
  before_filter :load_projects

 # caches_page [:index,:home,:about,:study,:school,:gpc,:school_case,:gpc_sa,:study_select_country,:study_news,
 #   :study_sign,:study_guide,:aavisa_info,:aavisa_team,:aavisa_zizhi,:aavisa_event,
 #   :country_canada,:country_america,:country_france,:country_australia,
 #   :career,:contact,:picture
 # ]

  def load_projects
    @projects = Project.all
  end

  def index
    redirect_to "/"
  end
  def home
    @pro_study = Project.find(:first,:conditions=>["cn_name=?","最新资讯"])
  end

  def about
   @pro_yamei = Project.find(:first,:conditions=>["cn_name=?","关于亚美"])
   @yamei_project = Project.find(:first,:conditions=>["cn_name=?","亚美介绍"])
   @pro_tool = Project.find_by_cn_name("实用工具")
  end

  def study
   @pro_liuxue = Project.find(:all,:conditions=>["cn_name like '留学'"],:order=>"sort_id DESC,created_at DESC")
   @pro_liuxue_guide = Project.find(:first,:conditions=>["cn_name like '留学指南'"],:order=>"sort_id DESC,created_at DESC")
   @pro_yimin = Project.find(:all,:conditions=>["cn_name like '移民'"],:order=>"sort_id DESC,created_at DESC")
   @pro_yimin_guide = Project.find(:first,:conditions=>["cn_name like '移民指南'"],:order=>"sort_id DESC,created_at DESC")
   @pro_college= Project.find(:first,:conditions=>["cn_name like '学院介绍'"],:order=>"sort_id DESC,created_at DESC")
   @pro_guide= Project.find(:first,:conditions=>["cn_name like '申请指南'"],:order=>"sort_id DESC,created_at DESC")
  end

  def school
    @pro_school = Project.find_by_cn_name('国际联合办学')
    @pro_school_1 = Project.find_by_cn_name('项目介绍',:conditions=>["parent_id = ?",@pro_school.id])
    @pro_school_2 = Project.find_by_cn_name('联办学校',:conditions=>["parent_id = ?",@pro_school.id])
  end
  def school_case
    @pro_school = Project.find_by_cn_name('国际联合办学')
    @pro_school_2 = Project.find_by_cn_name('联办学校',:conditions=>["parent_id = ?",@pro_school.id])
    @item = Item.find(:first,:conditions=>["project_id = ?",@pro_school_2.id])
  end
  def gpc
    @pro_gpc = Project.find_by_cn_name('萨省商贸合作')
    @pro_gpc_1 = Project.find_by_cn_name('萨省介绍',:conditions=>["parent_id = ?",@pro_gpc.id])
    @pro_gpc_2 = Project.find_by_cn_name('合作方式',:conditions=>["parent_id = ?",@pro_gpc.id])
    @pro_gpc_3 = Project.find_by_cn_name('融资条件',:conditions=>["parent_id = ?",@pro_gpc.id])
    @pro_gpc_4 = Project.find_by_cn_name('成功案例',:conditions=>["parent_id = ?",@pro_gpc.id])
  end
  
  def gpc_sa
    @pro_gpc = Project.find_by_cn_name('萨省商贸合作')
    @pro_gpc_1 = Project.find_by_cn_name('萨省介绍',:conditions=>["parent_id = ?",@pro_gpc.id])
    @items = Item.paginate :page=>params[:page]||1, :per_page=>10,:order=>"created_at DESC",:conditions=>["project_id = ?",@pro_gpc_1.id]
  end
  
  def study_select_country
    @canada = Project.find(:first,:conditions=>["cn_name like '加拿大'"])
    @america = Project.find(:first,:conditions=>["cn_name like '美国'"])
    @england = Project.find(:first,:conditions=>["cn_name like '英国'"])
    @france = Project.find(:first,:conditions=>["cn_name like '法国'"])
    @australia = Project.find(:first,:conditions=>["cn_name like '澳大利亚'"])
  end
  def study_news
    @parent = Project.find_by_cn_name('留学移民')
    @pro_study_new = Project.find_by_cn_name('最新资讯',:conditions=>["parent_id = ?",@parent.id])
    @items = Item.paginate :page=>params[:page]||1, :per_page=>8,:conditions=>["project_id = ?",@pro_study_new.id],:order=>"sort_id desc,created_at DESC"
  end
  def study_sign
    if params[:code] != ""
      @sign = Sign.find_by_record_code(params[:code])
    end
  end
  def study_guide
    @pro_liuxue_guide = Project.find_by_cn_name('留学指南')
    @pro_yimin_guide = Project.find_by_cn_name('移民指南')
    @pro_qa_guide = Project.find_by_cn_name('申请问答(Q&A)')
    #@pro_download = Project.find_by_cn_name('表格下载')
  end
 
  def aavisa_info
    @parent = Project.find_by_cn_name('关于亚美')
    @pro_yamei = Project.find_by_cn_name('亚美介绍',:conditions=>["parent_id = ?",@parent.id])
  end
  def aavisa_team
    redirect_to '/about'
  end
  def aavisa_zizhi
   
  end
  def aavisa_event
    redirect_to '/picture'
  end
  #country
  def country_canada
    @item = Item.find(:first,:conditions=>["project_id = ?",Project.find(:first,:conditions=>["cn_name like '加拿大'"])])
  end
  def  country_america
   @item = Item.find(:first,:conditions=>["project_id = ?",Project.find(:first,:conditions=>["cn_name like '美国'"])])
  end
  def country_england
   @item = Item.find(:first,:conditions=>["project_id = ?",Project.find(:first,:conditions=>["cn_name like '英国'"])])
  end
  def country_france
    @item = Item.find(:first,:conditions=>["project_id = ?",Project.find(:first,:conditions=>["cn_name like '法国'"])])
  end
  def country_australia
    @item = Item.find(:first,:conditions=>["project_id = ?",Project.find(:first,:conditions=>["cn_name like '澳大利亚'"])])
  end
  #about me
  def career
    @pro_yamei = Project.find_by_cn_name("关于亚美")
    @item = @pro_yamei.items.find_by_title("招贤纳才")
  end
  def contact
    @pro_yamei = Project.find_by_cn_name("关于亚美")
    @item = @pro_yamei.items.find_by_title("联系我们")
  end
  # display photo
  def picture

  end
end
