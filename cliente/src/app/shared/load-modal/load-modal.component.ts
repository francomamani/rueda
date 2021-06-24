import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-load-modal',
  templateUrl: './load-modal.component.html',
  styleUrls: ['./load-modal.component.scss'],
})
export class LoadModalComponent implements OnInit {

    public lottieConfig: Object;
    private anim: any;
    private animationSpeed: number = 1;

    constructor() {
        this.lottieConfig = {
            path: 'assets/lottie/loading.json',
            renderer: 'canvas',
            autoplay: true,
            loop: true,
        };
    }

    handleAnimation(anim: any) {
        this.anim = anim;
    }

    stop() {
        this.anim.stop();
    }

    play() {
        this.anim.play();
    }

    pause() {
        this.anim.pause();
    }

    setSpeed(speed: number) {
        this.animationSpeed = speed;
        this.anim.setSpeed(speed);
    }

  ngOnInit() {
  }

}
