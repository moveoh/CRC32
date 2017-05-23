부경대학교 3학년 1학기 데이터통신 실습과제
=============


~~~c
//CRC32 의사코드
function crc(bit array bitString[1..len], int polynomial) {
    shiftRegister := initial value // 보통 00000000 또는 11111111
    for i from 1 to len {
        if (shiftRegister의 최상위 비트) xor bitString[i] = 1
            shiftRegister := (shiftRegister left shift 1) xor polynomial
        else
            shiftRegister := shiftRegister left shift 1
    }
    return shiftRegister
}
~~~
