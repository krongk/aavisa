class AddMenu < ActiveRecord::Migration
  def self.up
    Project.create(:parent_id=>0,:cn_name=>"留学移民", :en_name=>'study-abroad')
    Project.create(:parent_id=>0,:cn_name=>'国际联合办学', :en_name=>'international-school')
    Project.create(:parent_id=>0,:cn_name=>'萨省商贸合作', :en_name=>'GPC-services')
    Project.create(:parent_id=>0,:cn_name=>'关于亚美', :en_name=>'aa-visa')
    Project.create(:parent_id=>1,:cn_name=>'最新资讯', :en_name=>'news')
    Project.create(:parent_id=>1,:cn_name=>'申请指南', :en_name=>'guide')
    Project.create(:parent_id=>1,:cn_name=>'加拿大', :en_name=>'canada')
    Project.create(:parent_id=>1,:cn_name=>'美国', :en_name=>'america')
    Project.create(:parent_id=>1,:cn_name=>'英国', :en_name=>'england')
    Project.create(:parent_id=>1,:cn_name=>'法国', :en_name=>'france')
    Project.create(:parent_id=>1,:cn_name=>'澳大利亚', :en_name=>'australia')
    Project.create(:parent_id=>2,:cn_name=>'项目介绍', :en_name=>'about-international-school')
    Project.create(:parent_id=>2,:cn_name=>'联办学校', :en_name=>'the-international-school')
    Project.create(:parent_id=>3,:cn_name=>'项目介绍', :en_name=>'about-GPC')
    Project.create(:parent_id=>3,:cn_name=>'合作方式', :en_name=>'Cooperation-method')
    Project.create(:parent_id=>3,:cn_name=>'融资条件', :en_name=>'financing')
    Project.create(:parent_id=>3,:cn_name=>'成功案例', :en_name=>'successful-case')
    Project.create(:parent_id=>4,:cn_name=>'亚美介绍', :en_name=>'about-aa-visa')
    Project.create(:parent_id=>4,:cn_name=>'最新活动', :en_name=>'aa-visa-news')
    Project.create(:parent_id=>4,:cn_name=>'案例展示', :en_name=>'aa-visa-case')
    Project.create(:parent_id=>4,:cn_name=>'律师团队', :en_name=>'lawyer-team')
  end

  def self.down
  end
end
