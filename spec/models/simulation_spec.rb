require 'rails_helper'
describe 'Simulation バリデーションの確認', type: :model do
  context '何も選択しなかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '',
        severitie_id: '',
        hierarchie_id: '',
        long_term_id: '',
        remark_id: '',
      )
        expect(simulation).not_to be_valid
    end
  end
  context '診断を選択肢なかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '',
        severitie_id: '1',
        hierarchie_id: '1',
        long_term_id: '1',
        remark_id: '1',
      )
        expect(simulation).not_to be_valid
    end
  end
  context '重症度分類を選択肢なかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '1',
        severitie_id: '',
        hierarchie_id: '1',
        long_term_id: '1',
        remark_id: '1',
      )
        expect(simulation).not_to be_valid
    end
  end
  context '階層区分を選択肢なかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '1',
        severitie_id: '1',
        hierarchie_id: '',
        long_term_id: '1',
        remark_id: '1',
      )
        expect(simulation).not_to be_valid
    end
  end
  context '長期区分を選択肢なかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '1',
        severitie_id: '1',
        hierarchie_id: '1',
        long_term_id: '',
        remark_id: '1',
      )
        expect(simulation).not_to be_valid
    end
  end
  context '人口呼吸器装着を選択肢なかった場合' do
    it 'バリデーションが発生する' do
      simulation = Simulation.new(
        diagnose_id: '1',
        severitie_id: '1',
        hierarchie_id: '1',
        long_term_id: '1',
        remark_id: '',
      )
        expect(simulation).not_to be_valid
    end
  end
end