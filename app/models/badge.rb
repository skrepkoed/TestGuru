class Badge < ApplicationRecord
  attr_accessor :report
  has_many :badge_users
  has_many :users, through: :badge_users

  def self.define_badge(test_passage)
    user = test_passage.user 
    test = test_passage.test
    category_tests = test.category.tests
    @report = {'Category finished' => category_finished?(category_tests, user),
              'Level finished' => level_finished?(test.level, user),
              'First atempt' => first_atempt?(test, user)
              }
    
    badges = []
    
    @report.each do |key, value|
      if value
        badges<< find_by(title: key) 
      end  
    end

    badges 
  end

  def self.category_finished?(category_tests, user)
    !category_tests.where.not(id:Test.joins(:test_passages).where(test_passages:{success:true, test_id: category_tests.pluck(:id), user_id:user.id}).pluck(:id)).exists?
  end

  def self.level_finished?(level, user)
    case level
    when 0..1 then tests = Test.easy
    when 2..4 then tests = Test.middle
    when 5..Float::INFINITY then tests = Test.hard
    end
    !tests.where.not(id: Test.joins(:test_passages).where(test_passages:{success:true, user_id: user.id}, tests:{level: level }).pluck(:id)).exists?
  end

  def self.first_atempt?(test, user)
    TestPassage.where(test_id: test.id, user_id: user.id).order(:updated_at).first.success == true
  end
end
