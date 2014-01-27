require 'volt/models'

describe Persistors::Store do
  it "should tell the persistor when the model has changed" do
    persistor = double('persistor')
    persistor_instance = double('persistor instance')
    expect(persistor_instance).to receive(:loaded)
    expect(persistor).to receive(:new).and_return(persistor_instance)
    
    @model = Model.new(nil, persistor: persistor)
    
    expect(persistor_instance).to receive(:changed)
    
    @model._attr = 'yes'
  end
  
  it "should tell the persistor when something is added to an array model" do
    persistor = double('persistor')
    persistor_instance = double('persistor instance')
    expect(persistor_instance).to receive(:loaded)
    expect(persistor).to receive(:new).and_return(persistor_instance)
    
    @model = ArrayModel.new([1,2,3], persistor: persistor)
    
    expect(persistor_instance).to receive(:added).with(4)
    
    @model << 4
  end
end