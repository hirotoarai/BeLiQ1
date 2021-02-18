class ApplicationRecord < ActiveRecord::Base
  # 対応するデータベースを用意しない場合
  self.abstract_class = true
end
