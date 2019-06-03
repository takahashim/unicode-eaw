RSpec.describe Unicode::Eaw do
  describe '#width' do

    it "has a version number" do
      expect(Unicode::Eaw::VERSION).not_to be nil
    end

    it "has a generated DATA" do
      expect(Unicode::Eaw::DATA).not_to be nil
    end

    context 'A' do
      it "is Narrow" do
        expect(Unicode::Eaw.width('A')).to eq :Na
      end
    end

    context 'Ａ' do
      it "is Fullwidth" do
        expect(Unicode::Eaw.width('Ａ')).to eq :F
      end
    end

    context 'あ' do
      it "is Wide" do
        expect(Unicode::Eaw.width('あ')).to eq :W
      end
    end

    context 'ｱ' do
      it "is Halfwidth" do
        expect(Unicode::Eaw.width('ｱ')).to eq :H
      end
    end

    context 'α' do
      it "is Ambiguous" do
        expect(Unicode::Eaw.width('α')).to eq :A
      end
    end

    context 'À' do
      it "is Neutral" do
        expect(Unicode::Eaw.width('À')).to eq :N
      end
    end

    context 'Out of range' do
      it "is Neutral" do
        expect(Unicode::Eaw.width("\u{40000}")).to eq :N
        expect(Unicode::Eaw.width("\u{50000}")).to eq :N
        expect(Unicode::Eaw.width("\u{60000}")).to eq :N
      end
    end

    it "supports Unicode 10.0.0" do
      expect(Unicode::Eaw.width("\u{1F6F8}")).to eq :W
    end

    it "supports Unicode 11.0.0" do
      expect(Unicode::Eaw.width("\u{1F99D}")).to eq :W
    end

    it "supports Unicode 12.1.0" do
      expect(Unicode::Eaw.width("\u{32FF}")).to eq :W
    end

  end
end
