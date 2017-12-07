package;

import kha.Framebuffer;
import kha.Assets;
import kha.Scheduler;
import kha.System;
import kha.input.Keyboard;
import kha.input.KeyCode;
import kha.math.FastMatrix3;
import kha.math.FastVector2;

using kha.graphics2.GraphicsExtension;

class Project {
	
	var ship: SGShip;
	var ship2: SGShip;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		ship = new SGShip(System.windowWidth(0)/2, System.windowHeight(0)/2, 5./60);
		ship2 = new SGShip(System.windowWidth(0)/2.5, System.windowHeight(0)/1.5, 10./60);

		SGInputManager.Get().AddDownObserver(KeyCode.R, IEI);
	}

	public function Restart() {

	}

	public function IEI() {
		trace("IEEEEEEEEEEEEEEEI");
	}

	function update(): Void {
		ship.update();
		ship2.update();
	}

	function render(framebuffer: Framebuffer): Void {
		var g2 = framebuffer.g2;

		g2.begin();
			ship.render(g2);
			ship2.render(g2);
		g2.end();
	}
}
