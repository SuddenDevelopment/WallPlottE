/*

cylon for pi: 
	https://cylonjs.com/documentation/platforms/raspberry-pi/
servo board: 
	https://cylonjs.com/documentation/drivers/pca9685/
servo:  
	https://cylonjs.com/documentation/drivers/continuous-servo/
sensor board:
 	https://github.com/alphacharlie/node-ads1x15

*/

var ads1x15 = require('node-ads1x15');  
var chip = 1; //0 for ads1015, 1 for ads1115  
var adc = new ads1x15(chip); 
var Cylon = require("cylon");

Cylon.robot({
    connections: {
        raspi: {
            adaptor: 'raspi'
        }
    },

    devices: {
        pca9685: {
            driver: 'pca9685'
        }
    },

    work: function(my) {

    	var channel = 0; //channel 0, 1, 2, or 3...  
		var samplesPerSecond = '250'; // see index.js for allowed values for your chip  
		var progGainAmp = '4096'; // see index.js for allowed values for your chip   
		var reading  = 0;  
 
		  adc.readADCSingleEnded(channel, progGainAmp, samplesPerSecond, function(err, strData){   
		    if(err){ throw err; } 
		    console.log(strData);
		  });

    	//servo stuff
        var min = 700;
        var max = 1100;
        my.pca9685.setPWMFreq(60);
        my.pca9685.setPWM(0, 0, min);
        if(!adc.busy){adc.readADCSingleEnded(channel, progGainAmp, samplesPerSecond, function(err, strData){   
		    if(err){ throw err; } 
		    console.log(strData);
		  });}
        after((5).seconds(), function() { my.pca9685.setPWM(0, 0, max);});
        if(!adc.busy){adc.readADCSingleEnded(channel, progGainAmp, samplesPerSecond, function(err, strData){   
		    if(err){ throw err; } 
		    console.log(strData);
		  });}
        after((10).seconds(), function(){ my.pca9685.stop(); });
        if(!adc.busy){adc.readADCSingleEnded(channel, progGainAmp, samplesPerSecond, function(err, strData){   
		    if(err){ throw err; } 
		    console.log(strData);
		  });}
    }
}).start();