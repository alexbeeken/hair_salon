require('spec_helper')

describe('#name')
  it 'displays the name of a stylist' do
    test_stylist = Stylist.new({:name => "Tina"})
    expect(test_stylist.name).to(eq("Tina"))
  end
end

describe('#save')
  it 'saves the stylist to the database' do
    test_stylist = Stylist.new({:name => "Tina"})
    test_stylist.save()
    expect(Stylist.all).to(eq([test_stylist]))
  end
end

describe('.all')
  it 'displays all stylists from the database' do
    expect(Stylist.all).to(eq([]))
  end
end

