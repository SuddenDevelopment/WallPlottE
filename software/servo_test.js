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

        var min = 700;
        var max = 1100;

        // set the frequency to 60hz
        my.pca9685.setPWMFreq(60);

        // rotate to and hold the minium position
        my.pca9685.setPWM(0, 0, min);

        after((5).seconds(), function() {
            // rotate to and hold the maxium position
            my.pca9685.setPWM(0, 0, max);
        });

        after((10).seconds(), function() {
            // reset and stop all outputs
            my.pca9685.stop();
        });
    }
}).start();