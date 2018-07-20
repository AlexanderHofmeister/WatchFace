using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as ActMon;

class WatchFaceMasterView extends Ui.WatchFace {
    
    
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    }

  

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
     
        var clockTime = Sys.getClockTime();
        var hour = clockTime.hour;
         dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
         dc.drawText(dc.getWidth() / 2 , 22, Graphics.FONT_SYSTEM_LARGE, hour.toString(), Gfx.TEXT_JUSTIFY_RIGHT);
         dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
         dc.drawText(dc.getWidth() / 2 , 22, Graphics.FONT_SYSTEM_LARGE, clockTime.min.toString(), Gfx.TEXT_JUSTIFY_LEFT);
         
        var battery = Sys.getSystemStats().battery;
        
         
         if(battery < 30) {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
         } else if (battery > 75) {
            dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
         }else {
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
         }
         dc.drawText(dc.getWidth() / 9 , 75, Graphics.FONT_SYSTEM_MEDIUM, Lang.format("$1$%", [battery.format("%2d")]), Gfx.TEXT_JUSTIFY_LEFT);
        
            
                 var steps = ActMon.getInfo().steps;   
         var stepGoal = ActMon.getInfo().stepGoal;   
         var stepPercent = steps / stepGoal * 100;
         
         if(stepPercent < 30) {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
         } else if (stepPercent > 75) {
            dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
         }else {
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
         }
    
         dc.drawText((dc.getWidth() / 2) - 55 , dc.getHeight() / 2 + 10 , Graphics.FONT_SYSTEM_MEDIUM, steps + " / " + stepGoal, Gfx.TEXT_JUSTIFY_LEFT);
         
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
