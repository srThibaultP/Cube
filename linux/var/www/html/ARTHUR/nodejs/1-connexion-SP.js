var serialport=require("serialport");
var SP1=new serialport("/dev/cu.usbserial-18ANB001",{
//baudrate
baudRate:9600
});

//événement sur l'ouverture du port SP1
SP1.on('open', function () {
  console.log('Port com ouvert...')
})
