class Severitie < ActiveHash::Base
  self.data = [
    {id: 1, name: "認定された"}, {id: 2, name: "認定されていない"}
  ]
end