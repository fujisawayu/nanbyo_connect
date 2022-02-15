class Hierarchie < ActiveHash::Base
  self.data = [ 
    {id: 1, name: '生活保護'},{id: 2, name: '低所得Ⅰ'},
    {id: 3, name: '低所得Ⅱ'},{id: 4, name: '一般所得Ⅰ'},
    {id: 5, name: '一般所得Ⅱ'},{id: 6, name: '上位所得'}
  ]
end