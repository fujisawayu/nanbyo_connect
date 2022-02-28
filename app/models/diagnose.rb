class Diagnose < ActiveHash::Base
  self.data = [ 
    {id: 1, name: '診断された'},{id: 2, name: '診断されていない'}
  ]
end