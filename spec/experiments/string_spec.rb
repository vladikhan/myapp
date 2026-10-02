require "spec_helper"

describe String do
   describe "#<<" do
    example "Adding Characters" do
      s = "ABC"
      s<<"D"
      expect(s.size).to eq(4)
    end
       
      example "You can't add nil", :exception do
        s = "ABC"
        # s << nil
        # expect(s<<nil).to eg(4)
        expect { s << nil }.to raise_error(TypeError)
      end
    end
  end
   
