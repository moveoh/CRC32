require 'crc32'

class Crc32Controller < ApplicationController
  def index
  end

  def result
    string = params[:rawData]
    
    @div1 = string[0,4]
    @div2 = string[4,7]
    
    @checkSum1 = Crc32.calculate(@div1, 4, 0)
    @checkSum2 = Crc32.calculate(@div2, 4, 0)
    
    #실제로 보낼 합쳐진 데이터
    sendV1 = @div1+@checkSum1.to_s(2)
    sendV2 = @div2+@checkSum2.to_s(2)
    
    ##수신
    sendMsg1 = sendV1[0..3] 
    sendMsg2 = sendV2[0..3]
    
    #송신체크섬이 문제가 있는 경우
    #@sendCks1 = Crc32.calculate(sendMsg1,4,0)-1
    #송신체크섬이 무결한 경우
    @sendCks1 = Crc32.calculate(sendMsg1,4,0)
    @sendCks2 = Crc32.calculate(sendMsg2,4,0)
  end
end
