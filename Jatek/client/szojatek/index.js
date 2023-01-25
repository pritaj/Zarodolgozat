//Játékos név kiszedése
var jatekosnev = ""
//url paraméterből kivenni a jatekosnevét: 
const adatUrlből = window.location.search;
//Változókkiszedése
const adatok = new URLSearchParams(adatUrlből);
//leellenőrizzük, hogy van-e beírt név, ha igen, akkor játszhat, ha nem akkor visszaírányítjuk a keződoldlra
if(adatok.has("nev")){
    document.getElementById("jatekosnev").innerHTML = adatok.get("nev");
    jatekosnev = adatok.get("nev");
}
else{
    window.location.href = window.location.origin + "/jatek/client";
}
var szavak;
var palya

document.getElementById("visszaLink").href = window.location.origin + "/jatek/client";

function jatekletrehozas(){
    document.getElementById("bekeres").style.display = "none";
    document.getElementById("jatek").style.display = "block";
    document.getElementsByTagName("body")[0].style.display="block";

    palya = document.getElementById("nehezseg").value;

    switch(palya){
        case "1": 
            szavak = [
                new Szo('Körte', 4 , 11 , 0),
                new Szo('Alma', 0 , 0 , 1),    
                new Szo('Barack', 6, 0, 2),
                new Szo('Szilva', 8,5 , 3),
                new Szo('Mandarin', 12,5, 4),
                new Szo('Citrom', 5 , 11, 5),
                new Szo('Eper', 12,8,6),
                new Szo('Málna', 11,16,7)
            ];
            break;
        case "2":
            szavak = [
                new Szo('Cica', 16 , 16 , 0),
                new Szo('Kutya', 2 , 2 , 5),
                new Szo('Viziló', 2 , 7 , 1),
                new Szo('Bagoly', 11 , 4 , 2),
                new Szo('Hal', 0 , 16 , 3),
                new Szo('Sündisznó', 10 , 7 , 4),
                new Szo('Teknős', 10 , 6 , 6),
                new Szo('Patkány', 8 , 14 , 7),
                new Szo('Malac', 11 , 1 , 5),
                new Szo('Kecske', 10 , 15 , 0),
            ];
            break;
        case "3":
            szavak = [
                new Szo('Zokni', 10 , 5 , 4),
                new Szo('Bugyi', 10 , 8 , 6),
                new Szo('Nadrág', 5 , 10 , 3),
                new Szo('Ing', 1 , 13 , 2),
                new Szo('Farmer', 4 , 13 , 1),
                new Szo('Blúz', 4 , 2 , 0),
                new Szo('Kesztyű', 10 , 11 , 7),
                new Szo('Póló', 12 , 4 , 5),
                new Szo('Sál', 9 , 2 , 6),
                new Szo('Sapka', 15 , 11 , 4),
            ]

        
    }

    jatekKezdese();
}


class Szo{
    //irany: integer 
    // 0 -> fel
    // 1 -> le
    // 2 -> jobbra
    // 3 -> balra
    // 4 -> jobb fel átló
    // 5 -> jobb le átló
    // 6 -> bal fel átló
    // 7 -> bal le áltó
    constructor(szo,sor,oszlop,irany){
        this.szo = szo;
        this.sor = sor;
        this.oszlop = oszlop;
        this.irany = irany;
    }

    kijelolendoPontok(){
        let kijelolendoPontok = [];
        let sor = this.sor;
        let oszlop = this.oszlop

        for(let i = 0; i < this.szo.length; i++){
            kijelolendoPontok.push({sor: sor, oszlop: oszlop});
            switch(this.irany){
                case 0: {
                    sor--;
                    break;
                }
                case 1: {
                    sor++;
                    break;
                }
                case 2: {
                    oszlop++;
                    break;
                }
                case 3: {
                    oszlop--;
                    break;
                }
                case 4: {
                    oszlop++;
                    sor--;
                    break;
                }
                case 5: {
                    oszlop++;
                    sor++;
                    break;
                }
                case 6: {
                    oszlop--;
                    sor--;
                    break;
                }
                case 7: {
                    oszlop--;
                    sor++;
                    break;
                }
            }
        }

        return kijelolendoPontok;
    }
}

class KivalasztottBetu{
    constructor(betu,sor,oszlop,){
        this.betu = betu;
        this.sor = sor;
        this.oszlop = oszlop;
    }
}



gombok = [];

let betuhalmaz = document.getElementById("betuhalmaz");
const stopper = new Stopper();


//létrehozzunk egy olyan tömböt, amiben elmentjük, hogy mire kattintott rá. A pontos poziciójával együtt (sor, oszlop indexével)
kivalasztottBetuk = [];
function jatekKezdese(){
    betuhalmaz.innerHTML = "";
    document.getElementById('megtalaltszavak').innerHTML = "";
    document.getElementById("visszaLink").href = window.location;
    stopper.start();
    for(let sor = 0; sor < 17; sor++){
        gombok[sor] = [];
        for(let oszlop = 0; oszlop < 17; oszlop++){
            let gomb =  document.createElement("button");
            gomb.innerHTML =  `-2`;
            gomb.className = "betu";
            gomb.setAttribute("sor",sor);
            gomb.setAttribute("oszlop",oszlop);
            gomb.onclick = () =>{
                //a toggle visszaadja értékben, hogy hozzáadta -> true, vagy elvette -> false
                let hozzadva = gomb.classList.toggle("kivalasztott");            
                gombKattintasra(gomb.textContent, sor, oszlop, hozzadva);
            }
            gombok[sor][oszlop] = gomb;
            betuhalmaz.appendChild(gomb);
        }
    }

    betukLerakasa();
    randomBetuGeneralasaAzUresHelyekre();
    megkeresendoSzavakFeltoltes();
}

function getRandomCharacter(){
    let karakter = "QWERTZUIOPŐÚÖÜÓASDFGHJKLÉÁŰÍYXCVBNM";
    let randomIndex = Math.floor(Math.random() * karakter.length);
    let randomKarakter =  karakter.charAt(randomIndex);
    return randomKarakter;
}

function randomBetuGeneralasaAzUresHelyekre(){
    gombok.forEach(sor =>{
        sor.forEach(adottgomb => {
            if(adottgomb.textContent === "-2"){
                console.log("Üres gomb, ahova jön a random karakter");
                adottgomb.innerHTML = getRandomCharacter();
            }
        })
       
    });
}
function MegnyerteAJatekos(){
    //Elkell dönteni, hogy a játékos megtalálta-e az összes szót:
    let megkeresendoszoLista = document.getElementById("megkeresendoszavak");
    //hány darab elem van benne:
    let hanydarab = megkeresendoszoLista.children.length;
    if(hanydarab === 0){
        if (confirm("Nyertél! Akarsz még játszani?") === true) {
            document.getElementById("bekeres").style.display = "flex";
            document.getElementById("jatek").style.display = "none";
            document.getElementsByTagName("body")[0].style.display="flex";
          } else {
            
          }
        eredmeny = {
            nev:jatekosnev,
            palya: palya,
            masodperc: stopper.masodperc
        }
        postData("http://localhost/jatek/server/postSzokeresoEredmeny.php", eredmeny);
        stopper.stop();
    }
    console.log(hanydarab)
}

function SzoEllenorzes(){
    //hogy megnézzük, hogy a kiválasztott betűkből van-e keresett szó, ha van, akkor kivesszük a listából és átrákjuk a másik listába.
    //össszekell gyűjtünk azokat pontokat, ahol a betűket kell kijelölnie a játékosnak ezt a classban csináltuk meg
    //Lekérjük, hogy mit írt be eddig a felhasználó
    let keresendoSzo = document.getElementById("betuk").textContent;
    let van_eIlyenSzo = false;
    let szoIndex = -1;
    szavak.forEach((szo,index) => {
        if(szo.szo === keresendoSzo){
            szoIndex = index;
            van_eIlyenSzo = true;
            return;
        }
    });

    // ha nincs ilyen szó a listán, akkor kilépünk a függvényből
    if(van_eIlyenSzo === false) return; 

    //itt van megtalált szó.
   
    let megtalaltszoPontjai = szavak[szoIndex].kijelolendoPontok();
    //lekell ellenőrizni, hogy jó helyen jelölte-e ki a szót.
    let megfelel = false;
    kivalasztottBetuk.forEach(
        (betu, index) => {
            if(betu.sor === megtalaltszoPontjai[index].sor && betu.oszlop === megtalaltszoPontjai[index].oszlop){
                megfelel = true;
            }
            else{
                megfelel = false;
                return;
            }
        }
    );

    if(megfelel === true){
        //megtalálta a szót a játékos, a rendes helyén. 
        //lekérjük a megtalált szó lista elemenjét a listából majd elkérjük
        //levesszük a listáról: 
        megkeresendoListaElem = document.getElementById(keresendoSzo);
        megkeresendoListaElem.remove();
        //hozzáadjuk a másik listához
        let megtalaltszohozzadasa = document.getElementById('megtalaltszavak');
        let listaElem = document.createElement('li');
        listaElem.id = keresendoSzo;
        listaElem.innerHTML = keresendoSzo;
        megtalaltszohozzadasa.appendChild(listaElem);

        //a megtalált szó sor és oszlop indexeihez hozzákell rakni, még egy osztályt, ami változtatja a színt
        //végig kell mennünk a pontok szerint a tömbön
        megtalaltszoPontjai.forEach(pontok =>{
            let gomb = gombok[pontok.sor][pontok.oszlop];
            gomb.classList.remove("kivalasztott");
            gomb.classList.add("megtalalt");
        });
        //hogy működjön a többi szóra is, ha megtaláltuk a szót, akkor már nullázhatjuk a szónak a betűit amit kiváalsztott a user.
        kivalasztottBetuk = [];
        MegnyerteAJatekos();
    }
    
    console.log();
    
}

function megkeresendoSzavakFeltoltes(){
    let hova = document.getElementById('megkeresendoszavak');
    hova.innerHTML = "";
    szavak.forEach(element => {
        let listaElem = document.createElement('li');
        listaElem.id = element.szo;
        listaElem.innerHTML = element.szo;
        hova.appendChild(listaElem)
    })
}

function gombKattintasra(betu, sor, oszlop, hozzaadta){
    //ha hozzáadunk, akkor kikell tölteni a classt amit létrehoztunk. KivalasztottBetuk
    //betu , sor , oszlop
    if(hozzaadta === true){
        let kivalasztottbetu = new KivalasztottBetu(betu, sor, oszlop);
        //majd ezt a kivalasztottbetut, hozzáadjuk a tömbhöz
        kivalasztottBetuk.push(kivalasztottbetu);
        
    }
    else{
        /*

            this.betu = betu;
            this.sor = sor;
            this.oszlop = oszlop;
        */
        kivalasztottBetuk = kivalasztottBetuk.filter( (element) => {
            if(element.betu === betu && element.sor === sor && element.oszlop === oszlop){
                return false;
            }
            return true;
        })
    }   


    let osszesKivalasztottBetuk = "";
    //írjuk ki az össze betűt ami ki van választva
    kivalasztottBetuk.forEach((element) =>{
        osszesKivalasztottBetuk += element.betu;
    })
    
    
    document.getElementById("betuk").innerHTML = osszesKivalasztottBetuk;
    SzoEllenorzes();
}
//Betuklerakása
function betukLerakasa(){
    szavak.forEach(szo => {
        //szo.szo = szo.szo.toUpperCase();
        switch(szo.irany){
            case 0: {
                //felfele
                felfeleHaladvaSzo(szo.szo, szo.sor, szo.oszlop);
                break;
            }
            case 1: {
                lefeleHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
            case 2: {
                //jobbra
                jobbraHaladvaSzo(szo.szo, szo.sor, szo.oszlop);
                break;
            }
            case 3: {
                balraHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
            case 4: {
                jobbraFelHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
            case 5: {
                jobbraLeHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
            case 6: {
                balraFelHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
            case 7: {
                balraLeHaladvaSzo(szo.szo,szo.sor, szo.oszlop);
                break;
            }
        }
    })
}

//felfele szólerakása 
function felfeleHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        sor--;
    }

}

function lefeleHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        sor++;
    }

}

function jobbraHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop++;
    }

}

function balraHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop--;
    }
}
function jobbraFelHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop++;
        sor--;
    }
}
function jobbraLeHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop++;
        sor++;
    }
}
function balraLeHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop--;
        sor++;
    }
}
function balraFelHaladvaSzo(szo, sor, oszlop){
    for(let i = 0; i < szo.length; i++){
        gombok[sor][oszlop].innerHTML = szo[i];
        oszlop--;
        sor--;
    }
}


