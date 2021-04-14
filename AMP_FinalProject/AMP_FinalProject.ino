//DHT22, ESP32, DS3231


// Import required libraries
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "WiFi.h"
#include "ESPAsyncWebServer.h"
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include "RTClib.h"


// Replace with your network credentials
const char* ssid = "House Wifi";
const char* password = "moonkhan12";


#define TimeSetDelaySeconds 10 //specify how long of a delay you would like. Keep above 2**
#define STACK_SIZE 4096

DHT dht(27, DHT22); //

RTC_DS3231 rtc; //Create DS3231 object

AsyncWebServer server(80);// Instantiate an AsyncWebServer object with port 80

void task1(void *pvParameter)// program delay timer
{
    int counter = 0;
    const portTickType xDelay = 1000 / portTICK_RATE_MS;
    while(1)//for(int i = TimeSetDelaySeconds; i > 0; i--)
    {
      vTaskDelay( xDelay );
      if(TimeSetDelaySeconds <= counter)
      {
        break; 
      }
    }
     //Serial.println("Exit loop");
}




//Read from sensor. Sensor reading may take up to 2 seconds. //Important to not set an time for sampling of less than 2 seconds.
String readDHTTemperature() {
  float temp = dht.readTemperature(true); // true condition reads temp as Fahrenheit. //For Celsius leave condition blank.
  // Check if any reads failed
  if (isnan(temp)) {    
    Serial.println("Failed to read from DHT sensor!");
    return "--.--";
  }
  else {
    Serial.println(temp);
    return String(temp);
  }
}


String readDHTHumidity() { //works same as temp sensor
  float h = dht.readHumidity();
  if (isnan(h)) {
    Serial.println("Failed to read from DHT sensor!");
    return "--.--";
  }
  else {
    Serial.println(h);
    return String(h);
  }
}


//HTML JavaScript stuff
// <!--Comments are written like this for html-->
const char index_html[] PROGMEM = R"rawliteral(
<!DOCTYPE HTML><html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <style>
    html { <!--align center and set up text config... -->
     font-family: Arial;
     display: inline-block;
     margin: 0px auto;
     text-align: center;
    }
    h2 { font-size: 3.0rem; }
    p { font-size: 2.5rem; }
    .units { font-size: 1.2rem; }
    .dht-labels{
      font-size: 1.5rem;  <!-- smaller size so text can fit onto 1 line on any sized screen -->
      vertical-align:middle;
      padding-bottom: 20px; <!--buffer between lines -->
    }
  </style>
</head>
<body>
  <h2>Atmospheric Condition Monitor</h2>  <!-- website title -->
  <p>
    <i class="fas fa-thermometer-half" style="color:Tomato;"></i>   <!-- select icon type and color --> 
    <span class="dht-labels">Temperature</span>  <!-- text label -->
    <span id="temperature">%TEMPERATURE%</span> <!-- stors value for display -->
    <sup class="units">&deg;F</sup>
  </p>
  <p> 
    <!-- Samee as above -->
    <i class="fas fa-tint" style="color:#00add6;"></i> 
    <span class="dht-labels">Humidity</span>
    <span id="humidity">%HUMIDITY%</span>
    <sup class="units">%</sup>
  </p>
  <p>Last updated: <span id="datetime"></span></p>
  
  <script> <!-- JS code -->
  var dt = new Date(); <!-- create new date object -->
  if((dt.getMonth()+1) == 11) 
  {
    var mon = "Nov.";
  }
  else if((dt.getMonth()+1) == 12)
  {
    var mon = "Dec.";
  }
  else if((dt.getMonth()+1) == 1)
  {
    var mon = "Jan.";
  }
  else if((dt.getMonth()+1) == 2)
  {
    var mon = "Feb.";
  }
  else if((dt.getMonth()+1) == 3)
  {
    var mon = "Mar.";
  }
  else if((dt.getMonth()+1) == 4)
  {
    var mon = "Apr.";
  }
  else if((dt.getMonth()+1) == 5)
  {
    var mon = "May.";
  }
  else if((dt.getMonth()+1) == 6)
  {
    var mon = "Jun.";
  }
  else if((dt.getMonth()+1) == 7)
  {
    var mon = "Jul.";
  }
  else if((dt.getMonth()+1) == 8)
  {
    var mon = "Aug.";
  }
  else if((dt.getMonth()+1) == 9)
  {
    var mon = "Sep.";
  }
  else if((dt.getMonth()+1) == 10)
  {
    var mon = "Oct.";
  }
  var ampm = "AM"
  var h = dt.getHours()
  if(h > 12)
  {
    h = (h - 12);
    ampm = "PM"
  }
  if (h == 0)
  {
    h = 12;
  }
  document.getElementById("datetime").innerHTML = mon +" "+ (("0"+dt.getDate()).slice(-2)) +" at "+ h +":"+ (("0"+dt.getMinutes()).slice(-2)) + " " + ampm;
  setTimeout;
  </script>
  <!-- Footer -->
  <div>
  
  
  <footer class="w3-center w3-light-grey w3-padding-8">
  <br><br><br><br><br>
  <p style="margin:0;"><font size="2">Created by: Mubashar Khan, Samantha Chan, Lanny Dao<br>ECE 5436 Fall 2019</font></p>
  <p style="margin:2;"><font size="2"></font></p>

</footer>
</div>
</body>
<script>
setInterval(function ( ) {
  var xhttp = new XMLHttpRequest();//Allows part of the webpage to be updated without changing the whole page.
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) { //When readyState is 4 and status is 200, the response is ready: The webpage can be updated.
      document.getElementById("temperature").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/temperature", true);
  xhttp.send();
}, 10000 ) ;

setTimeout(function() {
  location.reload();
}, 10000);

setInterval(function ( ) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("humidity").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/humidity", true);
  xhttp.send();
}, 10000 ) ;
</script>
</html>)rawliteral";

// Replaces placeholder with DHT values
String processor(const String& var){
  //Serial.println(var);
  if(var == "TEMPERATURE"){
    return readDHTTemperature();
  }
  else if(var == "HUMIDITY"){
    return readDHTHumidity();
  }
  return String();
}

void setup(){
  // Serial port for debugging purposes
  Serial.begin(115200);

  dht.begin();
  
  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");


  delay(3000); //Time for the clock to set it self up; if it is not set up...
  if (! rtc.begin()) 
  {
    Serial.println("Couldn't find RTC");
    while (1);
  }

  if (rtc.lostPower()) 
  {
    Serial.println("RTC lost power, lets set the time!");
    // following line sets the RTC to the date &amp; time this sketch was compiled
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // This line sets the RTC with an explicit date &amp; time, for example to set
    // January 21, 2014 at 3am you would call:
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0)); //Year, month, Day, hour, minute, second
  }
 

  
  }
  xTaskCreate(task1, "task1", STACK_SIZE, NULL, 1, NULL); //higher number = higher priority level. 0 is lowest priority
  // Print ESP32 Local IP Address
  Serial.println(WiFi.localIP());

  // Route for root / web page
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/html", index_html, processor);
  });
  server.on("/temperature", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/plain", readDHTTemperature().c_str());
  });
  server.on("/humidity", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/plain", readDHTHumidity().c_str());
  });

  // Start server
  server.begin();
}

 
void loop(){
  DateTime now = rtc.now();
  //Serial.println(now.min());
  
  
}
