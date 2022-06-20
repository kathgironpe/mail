excluded = %i[any exclude factories if to].freeze

describe 'test factories' do
  FactoryBot.factories.map(&:name).each do |factory_name|
    next if excluded.include?(factory_name)

    it "the #{factory_name} factory is valid" do
      expect(build factory_name).to be_valid
    end
  end
end
