#define RAW_SIZE 128
#define ECC_SIZE 22
#define SYNDROME_SIZE 11
#define SHA256_SIZE 32
#define BUILTIN_LED 13

char raw[RAW_SIZE];
char ecc[ECC_SIZE];
char syndrome[SYNDROME_SIZE];
char sha256[SHA256_SIZE];

char tempByte = 0;

int count = 0;

void setup() {
  Serial.begin(230400);
  pinMode(BUILTIN_LED, OUTPUT);
  for (auto i = 0; i<RAW_SIZE; i++){
    raw[i] = random();
  }
  for (auto i = 0; i<ECC_SIZE; i++){
    ecc[i] = random();
  }
  for (auto i = 0; i<SHA256_SIZE; i++){
    sha256[i] = random();
  }
}

void loop() {
  if (Serial.available() > 0) {
    tempByte = Serial.read();
    digitalWrite(BUILTIN_LED, HIGH);
    switch (tempByte){
      case 0b01110000:  //RAW
        Serial.write(raw, RAW_SIZE);
        break;
      case 0b01110011:    //ECC
        read_syndrome();
        Serial.write(ecc, ECC_SIZE);
        break;
      case 0b01101011:  //SHA
        read_syndrome();
        Serial.write(sha256, SHA256_SIZE);
        break;
      default:
        break;
    }
    digitalWrite(BUILTIN_LED, LOW);
    
  }
}

void read_syndrome(){
  for (auto i = 0; i<SYNDROME_SIZE; i++){
    while (Serial.available() == 0){;}
    syndrome[i] = Serial.read();
  }
}

