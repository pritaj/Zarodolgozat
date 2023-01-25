class Stopper {
    masodperc = 0;
    SzamolasInterval;
    kijelzo;

    constructor() {
        this.masodperc = 0;
        this.kijelzo = document.querySelector("#ido");
    }

    start(){
       this.masodperc = 0; 
       this.SzamolasInterval = setInterval(() => this.szamolas(), 1000);
    }
  
    stop() {
        clearInterval(this.SzamolasInterval)
    }

    szamolas(){
        this.masodperc++;
        this.kijelzo.innerHTML = this.masodperc;
    }
}