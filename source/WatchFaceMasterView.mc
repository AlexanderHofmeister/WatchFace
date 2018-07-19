using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class WatchFaceMasterView extends Ui.WatchFace {
    
    var customFont = null;
    
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        customFont = Ui.loadResource(Rez.Fonts.customFont);
    }

  

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
     
        var clockTime = Sys.getClockTime();
        var hour = clockTime.hour;
         dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
         dc.drawText(dc.getWidth() / 2 - 30 , 22, Graphics.FONT_LARGE, hour.toString(), Gfx.TEXT_JUSTIFY_CENTER);
         dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
         dc.drawText(dc.getWidth() / 2  + 15, 22, Graphics.FONT_LARGE, clockTime.min.toString(), Gfx.TEXT_JUSTIFY_CENTER);
    }   

    function onShow() {
    }

    function onHide() {
    }

    function onExitSleep() {
    }

    function onEnterSleep() {
    }

}
